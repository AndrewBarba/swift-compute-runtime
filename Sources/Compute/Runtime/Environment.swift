//
//  Environment.swift
//  
//
//  Created by Andrew Barba on 1/12/22.
//

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(WASILibc)
import WASILibc
#endif


@propertyWrapper public struct EnvironmentVariable<Value: Sendable>: Sendable {
    
    public let key: String

    public let wrappedValue: Value

    public init(_ key: String, defaultValue: Value) where Value == String {
        self.key = key
        self.wrappedValue = Environment.get(key) ?? defaultValue
    }

    public init(_ key: String) where Value == String? {
        self.key = key
        self.wrappedValue = Environment.get(key)
    }
}

public struct Environment: Sendable {

    public static func get(_ key: String) -> String? {
        guard let pointer = getenv(key) else {
            return nil
        }
        return String(cString: pointer)
    }

    public static subscript(key: String) -> String? {
        return self.get(key)
    }

    public static subscript(key: String, default value: String) -> String {
        return self.get(key) ?? value
    }

    private init() {}
}

extension Environment {
    
    public struct Compute {

        @EnvironmentVariable("FASTLY_CACHE_GENERATION", defaultValue: "local")
        public static var cacheGeneration

        @EnvironmentVariable("FASTLY_CUSTOMER_ID", defaultValue: "local")
        public static var customerId

        @EnvironmentVariable("FASTLY_HOSTNAME", defaultValue: "localhost")
        public static var hostname

        @EnvironmentVariable("FASTLY_POP", defaultValue: "local")
        public static var pop

        @EnvironmentVariable("FASTLY_REGION", defaultValue: "local")
        public static var region

        @EnvironmentVariable("FASTLY_SERVICE_ID", defaultValue: "local")
        public static var serviceId

        @EnvironmentVariable("FASTLY_SERVICE_VERSION", defaultValue: "0")
        public static var serviceVersion

        @EnvironmentVariable("FASTLY_TRACE_ID", defaultValue: "local")
        public static var traceId

        private init() {}
    }
}
