//
//  ProductCellView.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 19/05/24.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .accessibilityIdentifier("productTitle")
                Text(product.category)
                    .fontWeight(.light)
                    .accessibilityIdentifier("productCategory")
            }
            Spacer()
            Text(product.price as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("productLabel")
        }
    }
}

#Preview {
    ProductCellView(product: Product(id: 1, title: "Eiger Bag", price: 2300, description: "Description", category: "close", image: .emptyString))
}
