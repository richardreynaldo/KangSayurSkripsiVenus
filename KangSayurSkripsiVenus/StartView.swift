//
//  StartView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 21/01/21.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        Group {
            if authentication.loggedInUser != nil {
                CustomTabView()
                    .accentColor(StyleColors.primaryRed)
            } else {
                SignIn()
                    .accentColor(StyleColors.primaryRed)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}