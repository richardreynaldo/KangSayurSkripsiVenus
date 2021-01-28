//
//  GlobalVariable.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation

var globalUserID: String = ""
var isCheckedChecker: Bool = false

// For isAdmin validation using @AppStorage – Currently not in used
enum Account {
    static let isAdmin: Bool = false
}

extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

extension MutableCollection {
    mutating func updateEach(_ update: (inout Element) -> Void) {
        for i in indices {
            update(&self[i])
        }
    }
}
