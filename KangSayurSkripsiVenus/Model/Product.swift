//
//  Product.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 11/01/21.
//

import Foundation

//struct Category: Codable, Identifiable {
//    var id: String
//    var name: String
//    var items: [Product]
//}

struct Product: Codable, Equatable, Identifiable, Hashable {
    var id: String
    var image: String
    var name: String
    var price: Int
    var stock: Int
    var desc: String
    var category: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case sayur = "Sayur"
        case buah = "Buah"
    }

    #if DEBUG
    static let example = Product(id: "001", image: "Brokoli", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli", category: "Sayuran")
    #endif
}
