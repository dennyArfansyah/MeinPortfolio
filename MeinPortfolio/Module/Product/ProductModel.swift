//
//  ProductModel.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 15/05/24.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

typealias Products = [Product]
