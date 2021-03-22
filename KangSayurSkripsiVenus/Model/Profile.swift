//
//  UserProfile.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 11/01/21.
//

import Foundation

struct Profile {
    var userID: String
    var firstName: String
    var lastName: String
    var email: String
    var dob: Date
    var address: [String]
    var isAdmin: Bool
    
    static let `default` = Self(userID: "", firstName: "Venus", lastName: "Dhammiko", email: "venusdhammiko@gmail.com", dob: Date(), address: ["Cipondoh", "Tangerang", "Banten"], isAdmin: true)
}

struct ProfilePemesan {
    var userID: String
    var firstName: String
    var lastName: String
    var email: String
    var dob: Date
    var address: [String]
    var isAdmin: Bool
    
    static let `default` = Self(userID: "", firstName: "Venus", lastName: "Dhammiko", email: "venusdhammiko@gmail.com", dob: Date(), address: ["Cipondoh", "Tangerang", "Banten"], isAdmin: true)
}
