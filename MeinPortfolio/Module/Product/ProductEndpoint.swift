//
//  ProductEndpoint.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

enum ProductEndpoint {
    case getProducts
}

extension ProductEndpoint: Endpoint {
    var path: String { "/products" }
    
    var method: RequestMethod { .get }
}
