//
//  SignUp-SetelAlamat.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SignUp_SetelAlamat: View {
    @EnvironmentObject var authentication: Authentication
    
    @State private var isLoading: Bool = false
    
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
    @State private var address: [String] = []
    
    @Binding var namaDepan: String
    @Binding var namaBelakang: String
    @Binding var birthdate: Date
    @Binding var email: String
    @Binding var kataSandi: String
    
    var capsuleColor: Color {
        return jalan.isEmpty || nomor.isEmpty || rt.isEmpty || rw.isEmpty || kelurahan.isEmpty || kecamatan.isEmpty || kota.isEmpty || provinsi.isEmpty || kodepos.isEmpty ? StyleColors.disabledButtonBg : StyleColors.primaryRed
    }
    
    func combineData() {
        address.append(perumahan)
        address.append(jalan)
        address.append(nomor)
        address.append(rt)
        address.append(rw)
        address.append(kelurahan)
        address.append(kecamatan)
        address.append(kota)
        address.append(provinsi)
        address.append(kodepos)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView {
                    VStack {
                        Text("Setel Alamat")
                            .font(.largeTitle).foregroundColor(Color.black)
                            .padding(.bottom, 10)
                        
                        Text("Alamat akan digunakan \n sebagai tujuan pengiriman")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top)
                    
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
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 32)
                    
                    VStack {
                        Button(action: {
                            combineData()
                            isLoading = true
                            DispatchQueue.main.async {
                                authentication.signUp(firstName: namaDepan, lastName: namaBelakang, email: email, dob: birthdate, address: address, password: kataSandi)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    isLoading = false
                                }
                            }
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(capsuleColor)
                                    .frame(height: 52)
                                
                                Text("Daftar")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .padding()
                        .padding([.top, .horizontal])
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
                    
                    ProgressView("Signing up...")
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: StyleColors.primaryRed))
                        .foregroundColor(StyleColors.primaryRed)
                }
            }
        }
    }
}

//struct SignUp_SetelAlamat_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp_SetelAlamat()
//    }
//}
