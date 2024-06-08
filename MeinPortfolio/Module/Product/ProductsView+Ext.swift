//
//  ProductsView+Ext.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 22/05/24.
//

extension ProductsView: ProductProtocol {
    func add(with product: Product) async {
        
    }
    
    func get() async {
        do {
            try await storeModel.get()
        } catch {
            guard let error = error as? NetworkError else {
                storeModel.errorMessage = error.localizedDescription
                return
            }
            storeModel.errorMessage = error.rawValue
            // will show pop up error
        }
    }
    
    func delete(with id: Int) async {
        
    }
    
    func update(with product: Product) async {
        
    }
    
    func deleteProduct(with id: Int) async {
        
    }
}
