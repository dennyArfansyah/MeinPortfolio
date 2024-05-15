//
//  ProductStoreModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 16/05/24.
//

import Foundation

class ProductStoreModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var errorMessage: String = .emptyString
    
    private var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension ProductStoreModel {
    func getProducts() async throws {
        products = try await networkService.fetchRequest(with: ProductEndpoint.getProducts)
    }
}
