//
//  UbahEmailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct UbahEmailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var userData: UserData
    
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
                        authentication.changeEmail(currentEmail: userData.profile?.email ?? "", newEmail: newEmail, currentPassword: password) { error in
                            if error != nil {
                                print("\(error?.localizedDescription ?? "")")
                            }
                            else {
                                print("Email changed successfully.")
                                userData.getUserData()
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }) {
                    Text("Done")
//                        .foregroundColor(StyleColors.primaryRed)
//                        .font(StyleFont.heading2)
                }).padding(.vertical)
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}
struct UbahEmailView_Previews: PreviewProvider {
    static var previews: some View {
        UbahEmailView()
    }
}
