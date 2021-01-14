//
//  SignUp-SetelAlamat.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignUp_SetelAlamat: View {
    @State private var perumahan = ""
    @State private var jalan = ""
    @State private var nomor = ""
    @State private var rt = ""
    @State private var rw = ""
    @State private var kelurahan = ""
    @State private var kecamatan = ""
    @State private var kota = ""
    @State private var provinsi = ""
    @State private var kodepos = ""
    
    var body: some View {
        ScrollView {
            VStack{
                Text("Setel Alamat")
                    .font(.largeTitle).foregroundColor(Color.black)
                    .padding(.bottom, 10)
                Text("Alamat akan digunakan \n sebagai tujuan pengiriman")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }.padding(.top, 15)
            VStack(alignment: .leading){
                Group{
                    TextField("Perumahan", text: $perumahan)
                        .padding(.top, 18)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Nama Jalan", text: $jalan)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Nomor", text: $nomor)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("RT", text: $rt)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("RW", text: $rw)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                }
                Group{
                    TextField("Kelurahan", text: $kelurahan)
                        .padding(.top, 18)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Kecamatan", text: $kecamatan)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Kota", text: $kota)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Provinsi", text: $provinsi)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                    
                    TextField("Kode Pos", text: $kodepos)
                        .padding(.top, 18)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                    Divider()
                }
            }.padding(.top, 20)
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
                }).padding(.top, 20)
                .padding(.bottom)
            }
        }.padding([.top, .leading, .trailing])
        .padding(.bottom, 8)
    }
}

struct SignUp_SetelAlamat_Previews: PreviewProvider {
    static var previews: some View {
        SignUp_SetelAlamat()
    }
}
