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
    
    static var secondaryRed : Color {
        return Color(hexString: "FFAA9D")
    }
    
    static var tertiaryRed : Color {
        return Color(hexString: "FFE2D2")
    }
    
    static var primaryYellow : Color {
        return Color(hexString: "FFEFC7")
    }
    
    static var secondaryYellow : Color {
        return Color(hexString: "FCF9F5")
    }
    
    static var primaryPurple : Color {
        return Color(hexString: "2F344E")
    }
    
    static var secondaryPurple : Color {
        return Color(hexString: "7775B4")
    }
    
    static var tertiaryPurple : Color {
        return Color(hexString: "9D89BA")
    }
    
    static var anotherPurple : Color {
        return Color(hexString: "B7B6E4")
    }
    
    static var fairPurple : Color {
        return Color(hexString: "F5F5FC")
    }
    
    static var secondaryButtonText : Color {
        return Color(hexString: "E07968")
    }
    
    static var selectedSegmentedControl : Color {
        return Color(hexString: "EFADA1")
    }
    
    static var accountPageLargeTitleH1H2Text : Color {
            return Color(hexString: "50555C")
    }
    
    static var accountPageSubtitleText : Color {
        return Color(hexString: "636363")
    }
    
    static var accountPageBodyText : Color {
        return Color(hexString: "272727")
    }
    
    static var accountPageCaptionSmall : Color {
        return Color(hexString: "898A8D")
    }
    
    static var titleColor : Color {
        return Color(hexString: "50555C")
    }
    
    static var disabledButtonBg: Color {
        return Color(hexString: "BDBDBD")
    }
    
    static var shadowColor : Color {
        return Color(#colorLiteral(red: 0.4352941176, green: 0.2078431373, blue: 0, alpha: 0.08385987945))
    }
    
    static var gradientBG : LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411765, green: 0.8823529412, blue: 0.8274509804, alpha: 1)), Color(#colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.9529411765, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
    }
    
    static var cardGradient : LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8784313725, green: 0.4745098039, blue: 0.4078431373, alpha: 1)), Color(#colorLiteral(red: 0.9294117647, green: 0.6156862745, blue: 0.5607843137, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
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
