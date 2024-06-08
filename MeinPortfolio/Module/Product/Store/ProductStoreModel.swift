//
//  ProductStoreModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 16/05/24.
//

import Observation

@Observable
final class ProductStoreModel {
    
    var products: [Product] = []
    var errorMessage: String = .emptyString
    
    private var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension ProductStoreModel: ProductStoreProtocol {
    func get() async throws {
        products = try await networkService.fetchRequest(with: ProductEndpoint.get)
    }
    
    func add(with product: ProductParam) async throws {
        products = try await networkService.fetchRequest(with: ProductEndpoint.add(product: product))
    }
    
    func update(with product: Product) async throws {
        products = try await networkService.fetchRequest(with: ProductEndpoint.update(product: product))
    }
    
    func delete(with id: Int) async throws {
        products = try await networkService.fetchRequest(with: ProductEndpoint.delete(id: id))
    }
}
