//
//  NetworkService.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 14/05/24.
//

import Combine
import Foundation

final class NetworkService: NetworkProtocol {
    
    func fetchRequest<T>(with endPoint: Endpoint) async throws -> T where T : Decodable {
        guard let urlRequest = createRequest(endpoint: endPoint) else {
            throw NetworkError.invalidDecode
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
                .dataTask(with: urlRequest) { data, response, _ in
                    guard response is HTTPURLResponse else {
                        continuation.resume(throwing: NetworkError.invalidURL)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                        continuation.resume(throwing: NetworkError.unexpectedStatusCode)
                        return
                    }
                    
                    guard let data = data else {
                        continuation.resume(throwing: NetworkError.unknown)
                        return
                    }
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let decodedResponse = try? jsonDecoder.decode(T.self, from: data) else {
                        continuation.resume(throwing: NetworkError.invalidDecode)
                        return
                    }
                    
                    continuation.resume(returning: decodedResponse)
                }
            task.resume()
        }
    }
    
    func fetchRequest<T>(with endPoint: Endpoint, resultHandler: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        guard let urlRequest = createRequest(endpoint: endPoint) else { return }
        let urlTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                resultHandler(.failure(.invalidURL))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                resultHandler(.failure(.unexpectedStatusCode))
                return
            }
            guard let data = data else {
                resultHandler(.failure(.unknown))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let decodedResponse = try? jsonDecoder.decode(T.self, from: data) else {
                resultHandler(.failure(.invalidDecode))
                return
            }
            resultHandler(.success(decodedResponse))
        }
        urlTask.resume()
    }
    
    func fetchRequest<T>(with endPoint: Endpoint, type: T.Type) -> AnyPublisher<T, NetworkError> where T : Decodable {
        guard let urlRequest = createRequest(endpoint: endPoint) else {
            precondition(false, "Failed URLRequest")
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                    throw NetworkError.invalidURL
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if error is DecodingError {
                    return NetworkError.invalidDecode
                } else if let error = error as? NetworkError {
                    return error
                } else {
                    return NetworkError.unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
