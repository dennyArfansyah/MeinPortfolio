//
//  NetworkError.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 14/05/24.
//

enum NetworkError: String, Error {
    case invalidJSON = "Invalid JSON"
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid Response"
    case invalidDecode = "Invalid Decode"
    case unexpectedStatusCode = "Unexpected Status Code"
    case unknown = "Unknown"
}
