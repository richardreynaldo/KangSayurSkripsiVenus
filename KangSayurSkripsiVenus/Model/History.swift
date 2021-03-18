//
//  History.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 23/01/21.
//

import Foundation

struct History: Codable, Equatable, Identifiable {
    var id: String = ""
    var orderDate: Date = Date()
    var paymentType: String = ""
    var status: String = ""
    var totalOrder: Int = 0
    var totalPrice: Int = 0
    var orders: [Orders] = []
    
    mutating func removeHistoryData() {
        self = History()
    }
    
    #if DEBUG
    static let example = History(id: "001", orderDate: Date(), paymentType: "Cash on Delivery", status: "Preparing", totalOrder: 10, totalPrice: 200000, orders: [])
    #endif
}

struct Orders: Codable, Equatable, Identifiable {
    var id: String = ""
    var orderID: String = ""
    var product: Product = Product.example
    var quantity: Int = 0
    
    mutating func removeOrdersData() {
        self = Orders()
    }
    
    #if DEBUG
    static let example = Orders(id: "", product: Product.example, quantity: 0)
    #endif
}
