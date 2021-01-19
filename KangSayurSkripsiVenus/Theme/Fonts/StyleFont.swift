//
//  StyleFont.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 12/01/21.
//

import Foundation
import SwiftUI

class StyleFont {
    
    static var largeTitle: UIFont {
        UIFont(name: "Sora-Light", size: 34)!
    }
    
    static var smallTitle: UIFont {
        UIFont(name: "Sora-SemiBold", size: 16)!
    }
    
    static var title1: Font {
        Font.custom("Sora-SemiBold", size: 24, relativeTo: .title2)
    }
    
    static var heading1: Font {
        Font.custom("Sora-SemiBold", size: 18, relativeTo: .headline)
    }

    static var heading2: Font {
        Font.custom("Sora-SemiBold", size: 17, relativeTo: .subheadline)
    }
    
    static var subtitle: Font {
        Font.custom("Sora-Regular", size: 13, relativeTo: .caption)
    }
    
    static var captionSmall: Font {
        Font.custom("Sora-Light", size: 11, relativeTo: .caption2)
    }
    
    static var graphText: Font {
        Font.custom("Sora-Bold", size: 13, relativeTo: .caption)
    }
    
    static var welcomeTo: Font {
        Font.custom("Sora-Bold", size: 24, relativeTo: .title2)
    }
    
    static var Lugna: Font {
        Font.custom("Sora-Light", size: 48, relativeTo: .largeTitle)
    }
    
    static var body: Font {
        Font.custom("Sora-Light", size: 15, relativeTo: .subheadline)
    }
    
    static var bodyMood: Font {
        Font.custom("Sora-Light", size: 15, relativeTo: .subheadline)
    }
    
    static var buttonText: Font {
        Font.custom("Sora-Medium", size: 15, relativeTo: .subheadline)
    }
    
    static var journalTitle: Font {
        Font.custom("Sora-SemiBold", size: 21, relativeTo: .title3)
    }
    
    static var signUp: Font {
        Font.custom("Sora-Bold", size: 18, relativeTo: .body)
    }
    
    static var signIn: Font {
        Font.custom("Sora-Bold", size: 18, relativeTo: .body)
    }
}
