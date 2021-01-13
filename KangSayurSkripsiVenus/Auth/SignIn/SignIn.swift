//
//  SignIn.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignIn: View {
    @State private var email = ""
    @State private var password = ""

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
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(height: 52)
                        
                        Text("Masuk")
                            .foregroundColor(Color.white)
                    }
                }).padding(.top, UIScreen.main.bounds.maxY * 0.357)
                .padding(.bottom)
                
                HStack{
                    Text("Belum punya akun?")
                    Button(action: {
                    }, label: {
                        ZStack {
                            Text("Daftar")
                                .underline()
                        }
                    })
                }
            }
        }.padding([.top, .leading, .trailing])
        .padding(.bottom, 8)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
