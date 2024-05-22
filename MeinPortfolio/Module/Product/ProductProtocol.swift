//
//  ProductProtocol.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 22/05/24.
//

protocol ProductProtocol {
    func get() async
    func add(with product: Product) async
    func delete(with id: Int) async
    func update(with product: Product) async
}
