//
//  StartView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 21/01/21.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var userData: UserData
//    @State private var isActive: Bool = false
    
    var body: some View {
        Group {
            if authentication.loggedInUser != nil {
                Group {
                    ZStack {
                        if isActive {
                            if !(userData.profile?.isAdmin ?? false) {
                                CustomTabView()
                            } else {
                                CustomAdminTabView()
                            }
                        }
                        else {
                            VStack {
                                Text("KangSayur")
                                    .font(Font.custom("Sora-SemiBold", size: 44))
                                    .foregroundColor(StyleColors.titleText)
                                
                                ProgressView("Loading...")
                                    .scaleEffect(1.0, anchor: .center)
                                    .progressViewStyle(CircularProgressViewStyle(tint: StyleColors.primaryRed))
                                    .foregroundColor(StyleColors.primaryRed)
                            }
                            .padding()
                        }
                    }
                    .onAppear {
                        DispatchQueue.global(qos: .userInitiated).async {
                            userData.getUserData()
                        }
                    }
                }
            } else {
                SignIn()
            }
        }
        .accentColor(StyleColors.primaryRed)
        .animation(.default)
        .transition(.opacity)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
