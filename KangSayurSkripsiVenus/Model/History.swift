//
//  History.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 23/01/21.
//

import Foundation

struct History: Codable, Equatable, Identifiable {
    var id: String
    var product: Product
    var quantity: Int
    var dateTime: Date
    var status: Bool
}
