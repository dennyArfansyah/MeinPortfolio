//
//  ProductViewModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

// separating Product as ViewModel
struct ProductViewModel: Identifiable {
        
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int { product.id }
    var title: String { product.title }
    var price: Double { product.price }
    var description: String { product.description }
    var image: String { product.image }
    var category: String { product.category }
}
