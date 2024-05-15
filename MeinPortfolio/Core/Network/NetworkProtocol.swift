//
//  NetworkProtocol.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 14/05/24.
//

import Combine
import Foundation

protocol NetworkProtocol {
    func fetchRequest<T: Decodable>(with endPoint: Endpoint) async throws -> T
    func fetchRequest<T: Decodable>(with endPoint: Endpoint, resultHandler: @escaping (Result<T, NetworkError>) -> Void)
    func fetchRequest<T: Decodable>(with endPoint: Endpoint, type: T.Type) -> AnyPublisher<T, NetworkError>
}

extension NetworkProtocol {
    func createRequest(endpoint: Endpoint) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        guard let url = urlComponents.url else { return nil }
        
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        if let body = endpoint.body {
            request.httpBody = try? encoder.encode(body)
        }
        return request
    }
}
