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
        GeometryReader { geometry in
            ZStack {
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
                    }
                    .padding(.top, UIScreen.main.bounds.maxY * 0.178)
                    .padding(.horizontal, 32)
                    
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
                        .padding(.horizontal, 32)
                        
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
                        .padding(.bottom)
                    }
                }
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)
                
                if isLoading {
                    Rectangle()
                        .fill(Color.white.opacity(0.75))
                        .cornerRadius(15)
                        .shadow(color: Color(.lightGray), radius: 4, x: 0.0, y: 0.0)
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 5)
                    
                    ProgressView("Signing in...")
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: StyleColors.primaryRed))
                        .foregroundColor(StyleColors.primaryRed)
                }
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
