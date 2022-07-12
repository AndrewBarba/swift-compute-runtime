//
//  Store.swift
//  
//
//  Created by Andrew Barba on 3/30/22.
//

import ComputeRuntime

public struct Store: Sendable {

    internal let handle: StoreHandle

    public let name: String

    internal init(name: String) throws {
        var handle: StoreHandle = 0
        try wasi(fastly_kv__open(name, name.utf8.count, &handle))
        self.handle = handle
        self.name = name
    }

    public func lookup(_ key: String) throws -> Body? {
        do {
            var bodyHandle: BodyHandle = InvalidWasiHandle
            try wasi(fastly_kv__lookup(handle, key, key.utf8.count, &bodyHandle))
            return bodyHandle == InvalidWasiHandle ? nil : Body(bodyHandle)
        } catch WasiStatus.none {
            return nil
        }
    }

    public func insert(_ key: String, body: Body, maxAge: Int) throws {
        var inserted: UInt32 = 0
        try wasi(fastly_kv__insert(handle, key, key.utf8.count, body.handle, .init(maxAge), &inserted))
    }

    public func insert(_ key: String, bytes: [UInt8], maxAge: Int) throws {
        var body = try Body()
        try body.write(bytes)
        try insert(key, body: body, maxAge: maxAge)
    }
}
