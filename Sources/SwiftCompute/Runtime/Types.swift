//
//  Types.swift
//  
//
//  Created by Andrew Barba on 1/12/22.
//

public typealias WasiHandle = Int32

public enum WasiStatus: UInt32, Error, CaseIterable {
    case ok = 0
    case genericError
    case invalidArgument
    case badDescriptor
    case bufferTooSmall
    case unsupported
    case wrongAlignment
    case httpParserError
    case httpUserError
    case httpIncomplete
    case none
    case httpHeadTooLarge
    case httpInvalidStatus
}

public enum HttpVersion: UInt32 {
    case http0_9 = 0
    case http1_0
    case http1_1
    case h2
    case h3
}

public typealias HttpStatus = UInt16

public enum BodyWriteEnd: UInt32 {
    case back = 0
    case front
}

public typealias CacheOverrideTag = UInt32

public typealias BodyHandle = WasiHandle

public typealias RequestHandle = WasiHandle

public typealias ResponseHandle = WasiHandle

public typealias PendingRequestHandle = WasiHandle

public typealias EndpointHandle = WasiHandle

public typealias DictionaryHandle = WasiHandle

public typealias MultiValueCursor = UInt32

public typealias MultiValueCursorResult = Int64

extension CacheOverrideTag {
    public static let none: Self = 0x1
    public static let pass: Self = 0x2
    public static let ttl: Self = 0x4
    public static let staleWhileRevalidate: Self = 0x8
    public static let pci: Self = 0x10
}

public typealias HeaderCount = UInt32

public typealias IsDone = UInt32

public typealias DoneIndex = UInt32

public typealias ContentEncodings = UInt32

extension ContentEncodings {
    
    public static let gzip: Self = 1
}