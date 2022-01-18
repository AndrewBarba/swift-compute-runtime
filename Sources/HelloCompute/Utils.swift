//
//  Utils.swift
//  
//
//  Created by Andrew Barba on 1/17/22.
//

import Compute
import Foundation

func parseContentLength(_ responses: [FetchResponse]) -> Int {
    return responses.reduce(0) { total, res in
        return total + (Int(res.headers[.contentLength, default: "0"]) ?? 0)
    }
}

func parseRange(_ request: IncomingRequest, totalContentLength: Int) -> (start: Int, end: Int) {
    guard let rangeValue = request.headers[.range] else {
        return (0, totalContentLength - 1)
    }

    guard let rangeString = rangeValue.components(separatedBy: "=").last else {
        return (0, totalContentLength - 1)
    }

    let parts = rangeString.components(separatedBy: "-")

    guard parts.count == 2 else {
        return (0, totalContentLength - 1)
    }

    let start = Int(parts[0]) ?? 0

    let end = Int(parts[1]) ?? (totalContentLength - 1)

    return (start, end)
}

func rangeRequests(_ responses: [FetchResponse], range: (start: Int, end: Int)) -> [(url: URL, range: (start: Int, end: Int))] {
    guard responses.count > 0, range.start < range.end else {
        return []
    }

    let res = responses[0]

    let rest = Array(responses[1...])

    let contentLength = parseContentLength([res])

    if contentLength < range.start {
        return rangeRequests(rest, range: (range.start - contentLength, range.end - contentLength))
    }

    if range.end < contentLength {
        return [(res.url, range)]
    }

    return [(res.url, (range.start, contentLength))] + rangeRequests(rest, range: (0, range.end - contentLength))
}