//
//  SignUp.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignUp: View {
    @State private var namaDepan = ""
    @State private var namaBelakang = ""
    @State private var birthdate = Date()
    @State private var email = ""
    @State private var kataSandi = ""
    @State private var kataSandiUlang = ""
    //jangan lupa nama depan sama nama belakang disimpennya satuin di core data!
    
    var body: some View {
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
                    TextField("Kata sandi", text: $kataSandi)
                        .padding(.top, 40)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Masukkan kembali kata sandi", text: $kataSandiUlang)
                        .padding(.top, 40)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                }
            }
            .padding(.top, 80)
            .padding(.horizontal, 16)
            
            VStack{
                Button(action: {
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(height: 52)
                        
                        Text("Lanjut")
                            .foregroundColor(Color.white)
                    }
                    
                }).padding(.top, 70)
                .padding(.bottom)
                
                HStack{
                    Text("Sudah punya akun?")
                    Button(action: {
                    }, label: {
                        ZStack {
                            Text("Masuk")
                                .underline()
                        }
                    })
                }
            }
            
           
        }.padding([.top, .leading, .trailing])
        .padding(.bottom, 8)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
