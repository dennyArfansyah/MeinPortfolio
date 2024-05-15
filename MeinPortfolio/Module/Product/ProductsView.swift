//
//  ProductsView.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        List(viewModel.products) { product in
            Text(product.title)
        }.task {
            await viewModel.fetchRequest()
        }
    }
}

#Preview {
    ProductsView()
}
