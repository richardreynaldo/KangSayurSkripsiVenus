//
//  Product.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation

struct Category: Codable, Identifiable {
    var id: String
    var name: String
    var products: [Product]
}

struct Product: Codable, Equatable, Identifiable {
    var id: String
    var name: String
    var price: Int
    var stock: Int
    var desc: String

    #if DEBUG
    static let example = Product(id: "001", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli")
    #endif
}
