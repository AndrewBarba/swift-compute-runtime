//
//  Stubs.swift
//  
//
//  Created by Andrew Barba on 2/2/22.
//

/// Note:
/// Define all runtime functions stub which are imported from Compute environment.
/// SwiftPM doesn't support WebAssembly target yet, so we need to define them to
/// avoid link failure.
/// When running with Compute runtime library, they are ignored completely.
#if !arch(wasm32)

/* FASTLY_ABI */

func fastly_abi__init(_ abi_version: UInt64) -> Int32 { fatalError() }

/* FASTLY_DICTIONARY */

func fastly_dictionary__open(_ name: UnsafePointer<CChar>!, _ name_len: Int, _ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_dictionary__get(_ handle: WasiHandle, _ key: UnsafePointer<CChar>!, _ key_len: Int, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

/* FASTLY_LOG */

func fastly_log__endpoint_get(_ name: UnsafePointer<CChar>!, _ name_len: Int, _ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_log__write(_ handle: WasiHandle, _ msg: UnsafePointer<CChar>!, _ msg_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

/* FASTLY_GEO */

func fastly_geo__lookup(_ ip: UnsafePointer<UInt8>!, _ ip_len: Int, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

/* FASTLY_KV */

func fastly_kv__open(_ name: UnsafePointer<CChar>!, _ name_len: Int, _ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_kv__lookup(_ handle: WasiHandle, _ key: UnsafePointer<CChar>!, _ key_len: Int, _ body_handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_kv__insert(_ handle: WasiHandle, _ key: UnsafePointer<CChar>!, _ key_len: Int, _ body_handle: WasiHandle, _ max_age: UInt32, _ inserted: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

/* FASTLY_HTTP_BODY */

func fastly_http_body__new(_ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_body__append(_ dest: WasiHandle, _ src: WasiHandle) -> Int32 { fatalError() }

func fastly_http_body__close(_ handle: WasiHandle) -> Int32 { fatalError() }

func fastly_http_body__write(_ handle: WasiHandle, _ data: UnsafePointer<UInt8>!, _ data_len: Int, _ body_end: Int32, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_body__read(_ handle: WasiHandle, _ data: UnsafeMutablePointer<UInt8>!, _ data_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

/* FASTLY_HTTP_REQ */

func fastly_http_req__new(_ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__body_downstream_get(_ req: UnsafeMutablePointer<WasiHandle>!, _ body: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__cache_override_set(_ req_handle: WasiHandle, _ tag: UInt32, _ ttl: UInt32, _ stale_while_revalidate: UInt32) -> Int32 { fatalError() }

func fastly_http_req__cache_override_v2_set(_ req_handle: WasiHandle, _ tag: UInt32, _ ttl: UInt32, _ stale_while_revalidate: UInt32, _ surrogate_key: UnsafePointer<CChar>!, _ surrogate_key_len: Int) -> Int32 { fatalError() }

func fastly_http_req__close(_ handle: WasiHandle) -> Int32 { fatalError() }

func fastly_http_req__method_get(_ handle: WasiHandle, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__uri_get(_ handle: WasiHandle, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__version_get(_ handle: WasiHandle, _ version: UnsafeMutablePointer<Int32>!) -> Int32 { fatalError() }

func fastly_http_req__method_set(_ handle: WasiHandle, _ method: UnsafePointer<CChar>!, _ method_len: Int) -> Int32 { fatalError() }

func fastly_http_req__uri_set(_ handle: WasiHandle, _ uri: UnsafePointer<CChar>!, _ uri_len: Int) -> Int32 { fatalError() }

func fastly_http_req__version_set(_ handle: WasiHandle, _ version: Int32) -> Int32 { fatalError() }

func fastly_http_req__downstream_client_ip_addr(_ octets: UnsafeMutablePointer<UInt8>!, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__header_names_get(_ req_handle: WasiHandle, _ name: UnsafeMutablePointer<UInt8>!, _ name_len: Int, _ cursor: UInt32, _ ending_cursor: UnsafeMutablePointer<Int64>!, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__original_header_names_get(_ buf: UnsafeMutablePointer<UInt8>!, _ buf_len: Int, _ cursor: UInt32, _ ending_cursor: UnsafeMutablePointer<Int64>!, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__original_header_count(_ count: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__header_value_get(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_req__header_insert(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafePointer<CChar>!, _ value_len: Int) -> Int32 { fatalError() }

func fastly_http_req__header_append(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafePointer<CChar>!, _ value_len: Int) -> Int32 { fatalError() }

func fastly_http_req__header_remove(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int) -> Int32 { fatalError() }

func fastly_http_req__send(_ req_handle: WasiHandle, _ body_handle: WasiHandle, _ backend: UnsafePointer<CChar>!, _ backend_len: Int, _ resp_handle_out: UnsafeMutablePointer<WasiHandle>!, _ resp_body_handle_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__send_async(_ req_handle: WasiHandle, _ body_handle: WasiHandle, _ backend: UnsafePointer<CChar>!, _ backend_len: Int, _ pending_req_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__send_async_streaming(_ req_handle: WasiHandle, _ body_handle: WasiHandle, _ backend: UnsafePointer<CChar>!, _ backend_len: Int, _ pending_req_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__pending_req_poll(_ req_handle: WasiHandle, _ is_done_out: UnsafeMutablePointer<UInt32>!, _ resp_handle_out: UnsafeMutablePointer<WasiHandle>!, _ resp_body_handle_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__pending_req_wait(_ req_handle: WasiHandle, _ resp_handle_out: UnsafeMutablePointer<WasiHandle>!, _ resp_body_handle_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__pending_req_select(_ req_handles: UnsafeMutablePointer<WasiHandle>!, _ req_handles_len: Int, _ done_idx_out: UnsafeMutablePointer<WasiHandle>!, _ resp_handle_out: UnsafeMutablePointer<WasiHandle>!, _ resp_body_handle_out: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_req__auto_decompress_response_set(_ req_handle: WasiHandle, _ encodings: UInt32) -> Int32 { fatalError() }

func fastly_http_req__framing_headers_mode_set(_ req_handle: WasiHandle, _ mode: UInt32) -> Int32 { fatalError() }

func fastly_http_req__upgrade_websocket(_ backend: UnsafePointer<CChar>!, _ backend_len: Int) -> Int32 { fatalError() }

/* FASTLY_HTTP_RESP */

func fastly_http_resp__new(_ handle: UnsafeMutablePointer<WasiHandle>!) -> Int32 { fatalError() }

func fastly_http_resp__close(_ handle: WasiHandle) -> Int32 { fatalError() }

func fastly_http_resp__send_downstream(_ resp_handle: WasiHandle, _ body_handle: WasiHandle, _ streaming: Int32) -> Int32 { fatalError() }

func fastly_http_resp__version_get(_ handle: WasiHandle, _ version: UnsafeMutablePointer<Int32>!) -> Int32 { fatalError() }

func fastly_http_resp__status_get(_ handle: WasiHandle, _ status: UnsafeMutablePointer<Int32>!) -> Int32 { fatalError() }

func fastly_http_resp__version_set(_ handle: WasiHandle, _ version: Int32) -> Int32 { fatalError() }

func fastly_http_resp__status_set(_ handle: WasiHandle, _ status: Int32) -> Int32 { fatalError() }

func fastly_http_resp__header_names_get(_ resp_handle: WasiHandle, _ name: UnsafeMutablePointer<UInt8>!, _ name_len: Int, _ cursor: UInt32, _ ending_cursor: UnsafeMutablePointer<Int64>!, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_resp__header_value_get(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafeMutablePointer<UInt8>!, _ value_max_len: Int, _ nwritten: UnsafeMutablePointer<Int>!) -> Int32 { fatalError() }

func fastly_http_resp__header_insert(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafePointer<CChar>!, _ value_len: Int) -> Int32 { fatalError() }

func fastly_http_resp__header_append(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int, _ value: UnsafePointer<CChar>!, _ value_len: Int) -> Int32 { fatalError() }

func fastly_http_resp__header_remove(_ resp_handle: WasiHandle, _ name: UnsafePointer<CChar>!, _ name_len: Int) -> Int32 { fatalError() }

func fastly_http_resp__framing_headers_mode_set(_ resp_handle: WasiHandle, _ mode: UInt32) -> Int32 { fatalError() }

#endif
