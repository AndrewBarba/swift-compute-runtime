//
//  ComputeRuntime.h
//  
//
//  Created by Andrew Barba on 1/11/22.
//

#ifndef ComputeRuntime_h
#define ComputeRuntime_h

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunknown-attributes"

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define WASM_IMPORT(module, name) __attribute__((import_module(module), import_name(name)))

typedef uint32_t WasiHandle;

/* FASTLY_ABI */

WASM_IMPORT("fastly_abi", "init")
int fastly_abi__init(uint64_t abi_version);

/* FASTLY_DICTIONARY */

WASM_IMPORT("fastly_dictionary", "open")
int fastly_dictionary__open(const char* name, size_t name_len, WasiHandle* handle);

WASM_IMPORT("fastly_dictionary", "get")
int fastly_dictionary__get(WasiHandle handle, const char* key, size_t key_len, uint8_t* value, size_t value_max_len, size_t* nwritten);

/* FASTLY_LOG */

WASM_IMPORT("fastly_log", "endpoint_get")
int fastly_log__endpoint_get(const char* name, size_t name_len, WasiHandle* handle);

WASM_IMPORT("fastly_log", "write")
int fastly_log__write(WasiHandle handle, const char* msg, size_t msg_len, size_t* nwritten);

/* FASTLY_GEO */

WASM_IMPORT("fastly_geo", "lookup")
int fastly_geo__lookup(const uint8_t* ip, size_t ip_len, uint8_t* value, size_t value_max_len, size_t* nwritten);

/* FASTLY_KV */

// TODO: Enable remove once fastly adds the host call
// WASM_IMPORT("fastly_kv", "open")
// int fastly_kv__open(const char* name, size_t name_len, WasiHandle* handle);

// TODO: Enable remove once fastly adds the host call
// WASM_IMPORT("fastly_kv", "lookup")
// int fastly_kv__lookup(WasiHandle handle, const char* key, size_t key_len, uint32_t* body_handle);

// TODO: Enable remove once fastly adds the host call
// WASM_IMPORT("fastly_kv", "insert")
// int fastly_kv__insert(WasiHandle handle, const char* key, size_t key_len, uint32_t body_handle, uint32_t max_age, uint32_t* inserted);

// TODO: Enable remove once fastly adds the host call
// WASM_IMPORT("fastly_kv", "remove")
// int fastly_kv__remove(WasiHandle handle, const char* key, size_t key_len);

/* FASTLY_HTTP_BODY */

WASM_IMPORT("fastly_http_body", "new")
int fastly_http_body__new(WasiHandle* handle);

WASM_IMPORT("fastly_http_body", "append")
int fastly_http_body__append(WasiHandle dest, WasiHandle src);

WASM_IMPORT("fastly_http_body", "close")
int fastly_http_body__close(WasiHandle handle);

WASM_IMPORT("fastly_http_body", "write")
int fastly_http_body__write(WasiHandle handle, const uint8_t* data, size_t data_len, int body_end, size_t* nwritten);

WASM_IMPORT("fastly_http_body", "read")
int fastly_http_body__read(WasiHandle handle, uint8_t* data, size_t data_max_len, size_t* nwritten);

/* FASTLY_HTTP_REQ */

WASM_IMPORT("fastly_http_req", "new")
int fastly_http_req__new(WasiHandle* handle);

WASM_IMPORT("fastly_http_req", "body_downstream_get")
int fastly_http_req__body_downstream_get(uint32_t* req, uint32_t* body);

WASM_IMPORT("fastly_http_req", "cache_override_set")
int fastly_http_req__cache_override_set(WasiHandle req_handle, uint32_t tag, uint32_t ttl,
                                        uint32_t stale_while_revalidate);

WASM_IMPORT("fastly_http_req", "cache_override_v2_set")
int fastly_http_req__cache_override_v2_set(WasiHandle req_handle, uint32_t tag, uint32_t ttl,
                                           uint32_t stale_while_revalidate,
                                           const char *surrogate_key, size_t surrogate_key_len);

WASM_IMPORT("fastly_http_req", "close")
int fastly_http_req__close(WasiHandle handle);

WASM_IMPORT("fastly_http_req", "method_get")
int fastly_http_req__method_get(WasiHandle handle, uint8_t* value, size_t value_max_len, size_t* nwritten);

WASM_IMPORT("fastly_http_req", "uri_get")
int fastly_http_req__uri_get(WasiHandle handle, uint8_t* value, size_t value_max_len, size_t* nwritten);

WASM_IMPORT("fastly_http_req", "version_get")
int fastly_http_req__version_get(WasiHandle handle, int* version);

WASM_IMPORT("fastly_http_req", "method_set")
int fastly_http_req__method_set(WasiHandle handle, const char* method, size_t method_len);

WASM_IMPORT("fastly_http_req", "uri_set")
int fastly_http_req__uri_set(WasiHandle handle, const char* uri, size_t uri_len);

WASM_IMPORT("fastly_http_req", "version_set")
int fastly_http_req__version_set(WasiHandle handle, int version);

WASM_IMPORT("fastly_http_req", "downstream_client_ip_addr")
int fastly_http_req__downstream_client_ip_addr(uint8_t* octets, size_t* nwritten);

WASM_IMPORT("fastly_http_req", "header_names_get")
int fastly_http_req__header_names_get(WasiHandle req_handle, uint8_t *name, size_t name_len, uint32_t cursor,
                                      int64_t *ending_cursor, size_t *nwritten);

WASM_IMPORT("fastly_http_req", "original_header_names_get")
int fastly_http_req__original_header_names_get(uint8_t *buf, size_t buf_len, uint32_t cursor,
                                               int64_t *ending_cursor, size_t *nwritten);

WASM_IMPORT("fastly_http_req", "original_header_count")
int fastly_http_req__original_header_count(uint32_t *count);

WASM_IMPORT("fastly_http_req", "header_value_get")
int fastly_http_req__header_value_get(WasiHandle resp_handle, const char *name, size_t name_len,
                                      uint8_t* value, size_t value_max_len, size_t* nwritten);

WASM_IMPORT("fastly_http_req", "header_insert")
int fastly_http_req__header_insert(WasiHandle resp_handle, const char *name, size_t name_len,
                                   const char *value, size_t value_len);

WASM_IMPORT("fastly_http_req", "header_append")
int fastly_http_req__header_append(WasiHandle resp_handle, const char *name, size_t name_len,
                                   const char *value, size_t value_len);

WASM_IMPORT("fastly_http_req", "header_remove")
int fastly_http_req__header_remove(WasiHandle resp_handle, const char *name, size_t name_len);

WASM_IMPORT("fastly_http_req", "send")
int fastly_http_req__send(WasiHandle req_handle, uint32_t body_handle, const char *backend,
                          size_t backend_len, WasiHandle *resp_handle_out,
                          uint32_t *resp_body_handle_out);

WASM_IMPORT("fastly_http_req", "send_async")
int fastly_http_req__send_async(WasiHandle req_handle, uint32_t body_handle, const char *backend,
                                size_t backend_len, uint32_t *pending_req_out);

WASM_IMPORT("fastly_http_req", "auto_decompress_response_set")
int fastly_http_req__auto_decompress_response_set(WasiHandle req_handle, uint32_t encodings);

WASM_IMPORT("fastly_http_req", "send_async_streaming")
int fastly_http_req__send_async_streaming(WasiHandle req_handle, uint32_t body_handle,
                                          const char *backend, size_t backend_len,
                                          uint32_t *pending_req_out);

WASM_IMPORT("fastly_http_req", "pending_req_poll")
int fastly_http_req__pending_req_poll(WasiHandle req_handle, uint32_t *is_done_out,
                                      WasiHandle *resp_handle_out, uint32_t *resp_body_handle_out);

WASM_IMPORT("fastly_http_req", "pending_req_wait")
int fastly_http_req__pending_req_wait(WasiHandle req_handle, WasiHandle *resp_handle_out,
                                      uint32_t *resp_body_handle_out);

WASM_IMPORT("fastly_http_req", "pending_req_select")
int fastly_http_req__pending_req_select(WasiHandle req_handles[], size_t req_handles_len,
                                        uint32_t *done_idx_out, WasiHandle *resp_handle_out,
                                        uint32_t *resp_body_handle_out);

WASM_IMPORT("fastly_http_req", "framing_headers_mode_set")
int fastly_http_req__framing_headers_mode_set(WasiHandle req_handle, uint32_t mode);

/* FASTLY_HTTP_RESP */

WASM_IMPORT("fastly_http_resp", "new")
int fastly_http_resp__new(WasiHandle* handle);

WASM_IMPORT("fastly_http_resp", "close")
int fastly_http_resp__close(WasiHandle handle);

WASM_IMPORT("fastly_http_resp", "send_downstream")
int fastly_http_resp__send_downstream(WasiHandle resp_handle, uint32_t body_handle, int streaming);

WASM_IMPORT("fastly_http_resp", "version_get")
int fastly_http_resp__version_get(WasiHandle handle, int* version);

WASM_IMPORT("fastly_http_resp", "status_get")
int fastly_http_resp__status_get(WasiHandle handle, int* status);

WASM_IMPORT("fastly_http_resp", "version_set")
int fastly_http_resp__version_set(WasiHandle handle, int version);

WASM_IMPORT("fastly_http_resp", "status_set")
int fastly_http_resp__status_set(WasiHandle handle, int status);

WASM_IMPORT("fastly_http_resp", "header_names_get")
int fastly_http_resp__header_names_get(WasiHandle resp_handle, uint8_t *name, size_t name_len, uint32_t cursor,
                                       int64_t *ending_cursor, size_t *nwritten);

WASM_IMPORT("fastly_http_resp", "header_value_get")
int fastly_http_resp__header_value_get(WasiHandle resp_handle, const char *name, size_t name_len,
                                       uint8_t* value, size_t value_max_len, size_t* nwritten);

WASM_IMPORT("fastly_http_resp", "header_insert")
int fastly_http_resp__header_insert(WasiHandle resp_handle, const char *name, size_t name_len,
                                    const char *value, size_t value_len);

WASM_IMPORT("fastly_http_resp", "header_append")
int fastly_http_resp__header_append(WasiHandle resp_handle, const char *name, size_t name_len,
                                    const char *value, size_t value_len);

WASM_IMPORT("fastly_http_resp", "header_remove")
int fastly_http_resp__header_remove(WasiHandle resp_handle, const char *name, size_t name_len);

WASM_IMPORT("fastly_http_resp", "framing_headers_mode_set")
int fastly_http_resp__framing_headers_mode_set(WasiHandle resp_handle, uint32_t mode);


#pragma GCC diagnostic pop
#endif /* ComputeRuntime_h */
