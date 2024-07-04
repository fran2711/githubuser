//
//  API.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import Foundation

public class API {

    public static let headerJSON = ["Content-Type" : "application/json"]
    public static let headerImage = ["Content-Type": "image/png"]

    public enum Method: String { 
        case get = "GET"
        case post = "POST"
    }

    private static func request<T: Encodable>(url: String, method: Method, body: T) throws -> URLRequest {
        do {
            let httpBody = try JSONEncoder().encode(body)
            return request(url: url, method: method, httpBody: httpBody)
        } catch {
            throw error
        }
    }
    
    private static func request(url: String, method: Method, headers: [String: String] = headerJSON, httpBody: Data? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = httpBody
        return request
    }

    @discardableResult
    public static func data<T: Encodable>(url: String, method: Method, body: T) async throws -> Data? {
        let request = try request(url: url, method: method, body: body)
        return try await URLSession.shared.data(with: request).0
    }
    
    @discardableResult
    public static func data(url: String, method: Method) async throws -> Data? {
        let request = request(url: url, method: method)
        return try await URLSession.shared.data(with: request).0
    }
    
    @discardableResult
    public static func data(url: String, method: Method, headers: [String: String], httpBody: Data?) async throws -> Data? {
        let request = request(url: url, method: method, headers: headers, httpBody: httpBody)
        return try await URLSession.shared.data(with: request).0
    }
}
