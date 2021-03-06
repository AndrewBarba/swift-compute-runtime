//
//  Compute.swift
//
//
//  Created by Andrew Barba on 1/11/22.
//

public func onIncomingRequest(_ handler: @escaping (_ req: IncomingRequest, _ res: OutgoingResponse) async throws -> Void) async throws {
    // Initialize ABI
    try ABI.initialize()

    // Get downstream request
    let req = try IncomingRequest()

    // Create downstream response
    let res = try OutgoingResponse(writableBody: req.method != .head)

    do {
        // Check for special compute request, useful for pre-warming
        if isComputeStatusRequest(req) {
            return try await sendComputeStatusResponse(res)
        }

        // Run main handler
        try await handler(req, res)
    } catch {
        // Catch handler error by returning a 500
        console.error("onIncomingRequest:error", error.localizedDescription)
        try await res.status(500).send("Server error: \(error.localizedDescription)")
    }
}

private let computeStatusRequestMethods: Set<HTTPMethod> = [.get, .head, .options, .query]

private let computeStatusPath = "/__compute-status"

private func isComputeStatusRequest(_ req: IncomingRequest) -> Bool {
    return computeStatusRequestMethods.contains(req.method) && req.url.path == computeStatusPath
}

private func sendComputeStatusResponse(_ res: OutgoingResponse) async throws {
    try await res
        .status(204)
        .header("x-compute-service-id", Environment.Compute.serviceId)
        .header("x-compute-service-version", Environment.Compute.serviceVersion)
        .header("x-compute-trace-id", Environment.Compute.traceId)
        .send()
}
