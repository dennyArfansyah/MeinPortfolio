//
//  MeinPortfolioApp.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 14/05/24.
//

import SwiftUI

@main
struct MeinPortfolioApp: App {
    
    @StateObject private var storeModel = ProductStoreModel()
    
    var body: some Scene {
        WindowGroup {
            ProductsView()
                .environmentObject(storeModel)
        }
    }
}
