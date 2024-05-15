//
//  ProductsViewModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import Foundation

@MainActor
final class ProductsViewModel: ObservableObject {
    
//    @Published var products: [ProductViewModel] = []
    @Published var products: [Product] = []
    @Published var errorMessage: String = .emptyString
    
    private var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension ProductsViewModel {
    func fetchRequest() async {
        do {
            let productData = try await networkService.fetchRequest(with: ProductEndpoint.getProducts) as Products
//            products = productData.map(ProductViewModel.init)
            products = productData.map { $0 }
        } catch {
            guard let error = error as? NetworkError else { return }
            errorMessage = error.localizedDescription
        }
    }
}
