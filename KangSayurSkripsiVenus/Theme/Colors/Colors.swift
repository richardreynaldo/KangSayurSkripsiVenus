//
//  Colors.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 12/01/21.
//

import SwiftUI
import Foundation

class StyleColors {
    static var primaryRed : Color {
        return Color(hexString: "E97F6F")
    }
    
    static var background : Color {
        return Color(hexString: "E5E5E5")
    }
    
    static var titleText : Color {
        return Color(hexString: "50555C")
    }
    
    static var secondaryTitleText : Color {
        return Color(hexString: "272727")
    }
    
    static var secondaryYellow : Color {
        return Color(hexString: "FCF9F5")
    }
}

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
