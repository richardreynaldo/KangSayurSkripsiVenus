//
//  Cart.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 16/01/21.
//

import Foundation

struct Cart: Codable, Equatable, Identifiable {
    var id: String
    var product: Product
    var quantity: Int
    var dateTime: Date
    var isChecked: Bool
    var status: Bool
}
