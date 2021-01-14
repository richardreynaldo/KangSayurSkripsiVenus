//
//  Product.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation

struct Category: Codable, Identifiable {
    var id: String = "01"
    var name: String = "Sayuran"
    var products: [Product]
}

struct Product: Codable, Equatable, Identifiable {
    var id: String = "001"
    var name: String = "Brokoli"
    var price: Int = 10000
    var stock: Int = 20
    var desc: String = "Sayur Brokoli"

    #if DEBUG
    static let example = Product(id: "001", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli")
    #endif
}
