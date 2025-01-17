//
//  JustAsync.swift
//  Just
//
//  Created by Vyacheslav Ksenofontov on 30.10.2021.
//  Copyright © 2021 JustHTTP. All rights reserved.
//

import Foundation

@available(iOS 13.0, macOS 10.15, *)
public extension JustAdaptor {
    func request(
        _ method: HTTPMethod,
        url: URLComponentsConvertible,
        params: [String: Any],
        data: [String: Any],
        json: Any?,
        headers: [String: String],
        files: [String: HTTPFile],
        auth: Credentials?,
        cookies: [String: String],
        redirects allowRedirects: Bool,
        timeout: Double?,
        urlQuery: String?,
        requestBody: Data?,
        asyncProgressHandler: TaskProgressHandler?
    ) async throws -> HTTPResult {

        try await withCheckedThrowingContinuation { continuation in
            _ = request(
                method,
                url: url,
                params: params,
                data: data,
                json: json,
                headers: headers,
                files: files,
                auth: auth,
                cookies: cookies,
                redirects: allowRedirects,
                timeout: timeout,
                urlQuery: urlQuery,
                requestBody: requestBody,
                asyncProgressHandler: asyncProgressHandler,
                asyncCompletionHandler: {
                    continuation.resume(returning: $0)
                }
            )
        }
    }
   
//TODO:
//    func request(
//        _ method: HTTPMethod,
//        url: URLComponentsConvertible,
//        params: [String: Any],
//        data: [String: Any],
//        json: Any?,
//        headers: [String: String],
//        files: [String: HTTPFile],
//        auth: Credentials?,
//        cookies: [String: String],
//        redirects allowRedirects: Bool,
//        timeout: Double?,
//        urlQuery: String?,
//        requestBody: Data?,
//        asyncProgressHandler: TaskProgressHandler?
//    ) async throws -> Task<HTTPResult, Error> {
//        var httpResult: HTTPResult?
//        return await withTaskCancellationHandler {
//            httpResult?.cancel()
//        } operation: {
//            Task.detached {
//            try await withCheckedThrowingContinuation { continuation in
//                httpResult = request(
//                    method,
//                    url: url,
//                    params: params,
//                    data: data,
//                    json: json,
//                    headers: headers,
//                    files: files,
//                    auth: auth,
//                    cookies: cookies,
//                    redirects: allowRedirects,
//                    timeout: timeout,
//                    urlQuery: urlQuery,
//                    requestBody: requestBody,
//                    asyncProgressHandler: asyncProgressHandler,
//                    asyncCompletionHandler: {
//                        continuation.resume(returning: $0)
//                    }
//                )
//            }
//            }
//        }
        
}

@available(iOS 13.0, macOS 10.15, *)
extension JustOf {
    @discardableResult
    public func request(
        _ method: HTTPMethod,
        url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            method,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func delete(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .delete,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func get(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .get,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func head(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .head,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func options(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .options,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func patch(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .patch,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func post(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .post,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
    
    @discardableResult
    public func put(
        _ url: URLComponentsConvertible,
        params: [String: Any] = [:],
        data: [String: Any] = [:],
        json: Any? = nil,
        headers: [String: String] = [:],
        files: [String: HTTPFile] = [:],
        auth: (String, String)? = nil,
        cookies: [String: String] = [:],
        allowRedirects: Bool = true,
        timeout: Double? = nil,
        urlQuery: String? = nil,
        requestBody: Data? = nil,
        asyncProgressHandler: (TaskProgressHandler)? = nil
    ) async throws -> HTTPResult {
        
        try await adaptor.request(
            .put,
            url: url,
            params: params,
            data: data,
            json: json,
            headers: headers,
            files: files,
            auth: auth,
            cookies: cookies,
            redirects: allowRedirects,
            timeout: timeout,
            urlQuery: urlQuery,
            requestBody: requestBody,
            asyncProgressHandler: asyncProgressHandler
        )
    }
}
