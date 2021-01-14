//
//  OrderHeader.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import Foundation

struct OrderHeader: Codable, Equatable, Identifiable {
    var id: String? = "0001"
    var orderDate: Date? = Date()
    var paymentType: String? = "Cash"
    var status: String? = "Delivering"
    var totalOrder: Int? = 0
}
