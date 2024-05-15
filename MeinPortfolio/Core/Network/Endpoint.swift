//
//  Endpoint.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 14/05/24.
//

protocol Endpoint {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParams: [String: String]? { get }
    var pathParams: [String: String]? { get }
}

extension Endpoint {
    var scheme: String { "https" }
    var host: String { "fakestoreapi.com" }
    var header: [String: String]? { nil }
    var body: [String: String]? { nil }
    var queryParams: [String: String]? { nil }
    var pathParams: [String: String]? { nil }
}
