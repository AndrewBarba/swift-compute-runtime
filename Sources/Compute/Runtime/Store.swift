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
        fatalError("kv store unavailable when testing locally")
    }

    public func lookup(_ key: String) throws -> Body? {
        fatalError("kv store unavailable when testing locally")
    }

    public func insert(_ key: String, body: Body, maxAge: Int) throws {
        fatalError("kv store unavailable when testing locally")
    }

    public func insert(_ key: String, bytes: [UInt8], maxAge: Int) throws {
        fatalError("kv store unavailable when testing locally")
    }

    public func remove(_ key: String) throws {
        fatalError("kv store unavailable when testing locally")
    }
}
