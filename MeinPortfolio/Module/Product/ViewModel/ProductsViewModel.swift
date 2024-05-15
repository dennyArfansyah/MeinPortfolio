//
//  ProductsViewModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import Foundation

protocol ProductsViewViewProtocol {
    func getProducts() async
}

@MainActor
final class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = [] // directly using model for parsing data -> see line 29
    
//    @Published var productsVM: [ProductViewModel] = [] // using ViewModel first to parsing data -> see line 31-32
    
    @Published var errorMessage: String = .emptyString
    
    private var networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

extension ProductsViewModel: ProductsViewViewProtocol {
    
    func getProducts() async {
        do {
            products = try await networkService.fetchRequest(with: ProductEndpoint.getProducts)
            
//            let productData = try await networkService.fetchRequest(with: ProductEndpoint.getProducts) as [Product]
//            productsVM = productData.map(ProductViewModel.init)
        } catch {
            guard let error = error as? NetworkError else {
                errorMessage = error.localizedDescription
                return
            }
            errorMessage = error.rawValue
        }
    }
}
