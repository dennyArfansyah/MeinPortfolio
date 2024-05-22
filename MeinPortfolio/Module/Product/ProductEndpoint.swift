//
//  ProductEndpoint.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

enum ProductEndpoint {
    case get
    case add(product: ProductParam)
    case update(product: Product)
    case delete(id: Int)
}

extension ProductEndpoint: Endpoint {
    var path: String { "/products" }
    
    var method: RequestMethod {
        switch self {
        case .get:
            return .get
        case .add:
            return .post
        case .update:
            return .put
        case .delete:
            return .delete
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case .get:
            return [:]
        case .add(let param):
            let params: [String: Any] = [
                "title": param.title,
                "price": param.price,
                "description": param.description,
                "category": param.category
            ]
            return params
        case .update(let param):
            let params: [String: Any] = [
                "id": param.id,
                "title": param.title,
                "price": "\(param.price)",
                "description": param.description,
                "category": param.category
            ]
            return params
        case .delete(let id):
            return ["id": id]
        }
    }
}
