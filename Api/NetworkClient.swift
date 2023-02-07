//
//  NetworkClient.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

protocol NetworkClient {
    func perform<T: Decodable>(_ request: URLRequest) async throws -> T }

class MyNetworkClient: NetworkClient {
    func perform<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data) }
}

extension URLRequest {
    enum Method {
        case post
        case get
        case put
        case head
        case delete
        case options
        case trace
        case connect

        var rawValue: String {
            switch self {
                
                case .post:
                return "POST"

                case .get:
                return "GET"

                case .put:
                return "PUT"

                case .head:
                return "HEAD"

                case .delete:
                return "DELETE"

                case .options:
                return "OPTIONS"

                case .trace:
                return "TRACE"

                case .connect:
                return "CONNECT"

            }

        }
    }
}

extension URLRequest {
    init(url: URL, method: Method) {
        self.init(url: url)
        self.setValue("application/json",
        forHTTPHeaderField: "Content-Type")
        self.httpMethod = method.rawValue }

}

extension URLRequest {
    init(url: URL, method: Method, json
        object: Any) throws {
        self.init(url: url, method: method)
       
        self.httpBody = try
        JSONSerialization.data(withJSONObject: object)

    }

}
