//
//  SignUp.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var authentication: Authentication
    
    @State private var namaDepan = ""
    @State private var namaBelakang = ""
    @State private var birthdate = Date()
    @State private var email = ""
    @State private var kataSandi = ""
    @State private var kataSandiUlang = ""
    
    @Binding var isPresented: Bool
    
    var capsuleColor: Color {
        return namaDepan.isEmpty || namaBelakang.isEmpty || email.isEmpty || kataSandi.isEmpty || kataSandiUlang.isEmpty ? StyleColors.disabledButtonBg : StyleColors.primaryRed
    }
    
    //jangan lupa nama depan sama nama belakang disimpennya satuin di core data!
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading){
                        Group{
                            Text("Daftar")
                                .font(.largeTitle)
                            
                            TextField("Nama depan", text: $namaDepan)
                                .padding(.top, 40)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                            
                            Divider()
                            
                            TextField("Nama belakang", text: $namaBelakang)
                                .padding(.top, 40)
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                            
                            Divider()
                            
                            DatePicker(selection: $birthdate, in: ...Date(), displayedComponents: .date) {
                                Text("Tanggal lahir")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top, 40)

                            Divider()
                            
                            TextField("Email", text: $email)
                                .padding(.top, 40)
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                            
                            Divider()
                        }
                        Group{
                            SecureField("Kata sandi", text: $kataSandi)
                                .padding(.top, 40)
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                            
                            Divider()
                            
                            SecureField("Masukkan kembali kata sandi", text: $kataSandiUlang)
                                .padding(.top, 40)
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                            
                            Divider()
                        }
                    }
                    .padding(.top, 80)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        NavigationLink(destination: SignUp_SetelAlamat(namaDepan: $namaDepan, namaBelakang: $namaBelakang, birthdate: $birthdate, email: $email, kataSandi: $kataSandi)) {
                            ZStack {
                                Capsule()
                                    .fill(capsuleColor)
                                    .frame(height: 52)
                                
                                Text("Lanjut")
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.top, 70)
                        .padding(.bottom)
                        
                        HStack {
                            Text("Sudah punya akun?")
                            Button(action: {
                                isPresented = false
                            }, label: {
                                ZStack {
                                    Text("Masuk")
                                        .foregroundColor(StyleColors.primaryRed)
                                        .underline()
                                }
                            })
                        }
                        .padding(.top, -8)
                    }
                    
                   
                }
                .padding([.top, .leading, .trailing])
            }
            .navigationBarHidden(true)
        }
        .accentColor(StyleColors.primaryRed)
    }
}

//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}
