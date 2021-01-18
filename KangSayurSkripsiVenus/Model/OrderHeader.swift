//
//  OrderHeader.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import Foundation

struct OrderHeader: Codable, Equatable, Identifiable {
    var id: String?
    var orderDate: Date?
    var paymentType: String?
    var status: String?
    var totalOrder: Int?
}
