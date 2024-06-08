//
//  ProductStoreProtocol.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 22/05/24.
//

protocol ProductStoreProtocol {
    func get() async throws
    func add(with product: ProductParam) async throws
    func update(with product: Product) async throws
    func delete(with id: Int) async throws
}
