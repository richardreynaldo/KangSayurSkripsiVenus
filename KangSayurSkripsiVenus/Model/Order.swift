//
//  Order.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 25/01/21.
//

import Foundation

struct Order: Codable, Equatable, Identifiable {
    var id: String = ""
    var orderDate: Date = Date()
    var paymentType: String = ""
    var status: String = ""
    var totalOrder: Int = 0
    var totalPrice: Int = 0
    var userID: String = ""
    var cart: [Cart] = []
    
    mutating func removeOrderData() {
        self = Order()
    }
}
