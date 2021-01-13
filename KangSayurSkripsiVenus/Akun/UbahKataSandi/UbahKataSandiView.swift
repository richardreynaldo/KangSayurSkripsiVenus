//
//  UbahKataSandiView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct UbahKataSandiView: View {
    @State var oldPass: String = ""
    @State var newPass: String = ""
    @State var rePass: String = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack{
                    PasswordBottom(title: "Old Password", input: $oldPass)
                        .padding(.bottom)
                    
                    PasswordBottom(title: "New Password", input: $newPass)
                        .padding(.bottom)
                    
                    PasswordBottom(title: "Confirm Password", input: $rePass)
                        .padding(.bottom)
                    
                    Spacer()
                }
                .navigationBarTitle("Change Password", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    DispatchQueue.main.async {
                        //masukkin func buat check password kalo bener baru update passwordnya
                    }
                    
                }) {
                    Text("Done")
//                        .foregroundColor(StyleColors.primaryRed)
//                        .font(StyleFont.heading2)
                })
                .padding(.top, 108)
            }
        }
//        .background(StyleColors.secondaryYellow)
        .edgesIgnoringSafeArea(.top)
    }
}

struct UbahKataSandiView_Previews: PreviewProvider {
    static var previews: some View {
        UbahKataSandiView()
    }
}
