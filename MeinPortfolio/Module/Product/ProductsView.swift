//
//  ProductsView.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductsViewModel() // MVVM pattern
    @Environment(ProductStoreModel.self) var storeModel: ProductStoreModel // MV pattern
    
    var body: some View {
//        List(viewModel.products) { product in
//            Text(product.description)
//        }.task {
//            await viewModel.getProducts()
//        }
        
        List(storeModel.products) { product in
            ProductCellView(product: product)
        }.task {
            await get()
        }
    }
}

#Preview {
    ProductsView()
        .environment(ProductStoreModel())
}
