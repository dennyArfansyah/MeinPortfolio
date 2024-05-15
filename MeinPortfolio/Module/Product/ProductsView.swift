//
//  ProductsView.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductsViewModel() // MVVM pattern
    @EnvironmentObject private var storeModel: ProductStoreModel // MV pattern
    
    var body: some View {
//        List(viewModel.products) { product in
//            Text(product.description)
//        }.task {
//            await viewModel.getProducts()
//        }
        
        List(storeModel.products) { product in
            Text(product.title)
            Text(product.price as NSNumber, formatter: NumberFormatter.currency)
        }.task {
            await getProducts()
        }
    }
    
    private func getProducts() async {
        do {
            try await storeModel.getProducts()
        } catch {
            guard let error = error as? NetworkError else {
                storeModel.errorMessage = error.localizedDescription
                return
            }
            storeModel.errorMessage = error.rawValue
            // will show up error
        }
    }
}

#Preview {
    ProductsView()
        .environmentObject(ProductStoreModel())
}
