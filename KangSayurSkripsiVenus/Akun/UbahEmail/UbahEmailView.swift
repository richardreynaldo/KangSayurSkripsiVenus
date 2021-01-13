//
//  UbahEmailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct UbahEmailView: View {
    @State private var newEmail: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack{
                    ViewBottom(title: "New Email", input: $newEmail)
                        .keyboardType(.emailAddress)
                        .padding(.bottom)
                    
                    PasswordBottom(title: "Password", input: $password)
                        .padding(.bottom)
                    
                    Spacer()
                }
                .navigationBarTitle("Change Email", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    DispatchQueue.main.async {
                        //masukin func buat checkemail terus masukkin ke core data
                    }
                    
                }) {
                    Text("Done")
//                        .foregroundColor(StyleColors.primaryRed)
//                        .font(StyleFont.heading2)
                }).padding(.top, 108)
            }
        }
//        .background(StyleColors.secondaryYellow)
        .edgesIgnoringSafeArea(.top)
    }
}
struct UbahEmailView_Previews: PreviewProvider {
    static var previews: some View {
        UbahEmailView()
    }
}
