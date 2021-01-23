//
//  SignIn.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignIn: View {
    @EnvironmentObject var authentication: Authentication
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPresented: Bool = false
    
    var capsuleColor: Color {
        return email.isEmpty || password.isEmpty ? StyleColors.disabledButtonBg : StyleColors.primaryRed
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Masuk")
                    .font(.largeTitle)
                
                TextField("Email", text: $email)
                    .padding(.top, 40)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                Divider()
                
                SecureField("Kata Sandi", text: $password)
                    .padding(.top, 40)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                
                Divider()
            }.padding(.top, UIScreen.main.bounds.maxY * 0.178)
            .padding(.horizontal, 16)
            
            VStack{
                Button(action: {
                    DispatchQueue.main.async {
                        authentication.signIn(email: email, password: password)
                    }
                }, label: {
                    ZStack {
                        Capsule()
                            .fill(capsuleColor)
                            .frame(height: 52)
                        
                        Text("Masuk")
                            .foregroundColor(Color.white)
                    }
                })
                .padding(.top, UIScreen.main.bounds.maxY * 0.357)
                .padding(.bottom)
                .padding(.horizontal)
                
                HStack {
                    Text("Belum punya akun?")
                    Button(action: {
                        isPresented = true
                    }, label: {
                        ZStack {
                            Text("Daftar")
                                .foregroundColor(StyleColors.primaryRed)
                                .underline()
                        }
                    })
                    .fullScreenCover(isPresented: $isPresented) {
                        SignUp(isPresented: $isPresented)
                    }
                }
                .padding(.top, -8)
            }
        }
        .padding([.top, .leading, .trailing])
        .padding(.bottom, 8)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
