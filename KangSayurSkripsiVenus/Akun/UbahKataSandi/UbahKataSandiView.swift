//
//  UbahKataSandiView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct UbahKataSandiView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var authentication: Authentication
    @EnvironmentObject var userData: UserData
    
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
                        authentication.changePassword(email: userData.profile?.email ?? "", currentPassword: oldPass, newPassword: newPass) { error in
                            if error != nil {
                                print("\(error?.localizedDescription ?? "")")
                            }
                            else {
                                print("Password changed successfully.")
                                //isLoading = false
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                }) {
                    Text("Done")
//                        .foregroundColor(StyleColors.primaryRed)
//                        .font(StyleFont.heading2)
                })
                .padding(.vertical)
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}

struct UbahKataSandiView_Previews: PreviewProvider {
    static var previews: some View {
        UbahKataSandiView()
    }
}
