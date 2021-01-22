//
//  DataAlamatView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct DataAlamatView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
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
    
    func inputDataFromViewModel() {
        perumahan = userData.profile?.address[0] ?? ""
        jalan = userData.profile?.address[1] ?? ""
        nomor = userData.profile?.address[2] ?? ""
        rt = userData.profile?.address[3] ?? ""
        rw = userData.profile?.address[4] ?? ""
        kelurahan = userData.profile?.address[5] ?? ""
        kecamatan = userData.profile?.address[6] ?? ""
        kota = userData.profile?.address[7] ?? ""
        provinsi = userData.profile?.address[8] ?? ""
        kodepos = userData.profile?.address[9] ?? ""
    }
    
    func combineAddress() {
        userData.profile?.address[0] = perumahan
        userData.profile?.address[1] = jalan
        userData.profile?.address[2] = nomor
        userData.profile?.address[3] = rt
        userData.profile?.address[4] = rw
        userData.profile?.address[5] = kelurahan
        userData.profile?.address[6] = kecamatan
        userData.profile?.address[7] = kota
        userData.profile?.address[8] = provinsi
        userData.profile?.address[9] = kodepos
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack{
                    ViewBottom(title: "Perumahan", input: $perumahan)
                        .padding(.bottom)
                    ViewBottom(title: "Nama Jalan", input: $jalan)
                        .padding(.bottom)
                    ViewBottom(title: "Nomor", input: $nomor)
                        .padding(.bottom)
                    ViewBottom(title: "RT", input: $rt)
                        .padding(.bottom)
                    ViewBottom(title: "RW", input: $rw)
                        .padding(.bottom)
                    ViewBottom(title: "Kelurahan", input: $kelurahan)
                        .padding(.bottom)
                    ViewBottom(title: "Kecamatan", input: $kecamatan)
                        .padding(.bottom)
                    ViewBottom(title: "Kota", input: $kota)
                        .padding(.bottom)
                    ViewBottom(title: "Provinsi", input: $provinsi)
                        .padding(.bottom)
                    ViewBottom(title: "Kode Pos", input: $kodepos)
                        .padding(.bottom)
                }
                .navigationBarTitle("Change Email", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    combineAddress()
                    DispatchQueue.main.async {
                        userData.changeUserAddress(address: userData.profile?.address ?? [])
                        userData.getUserData()
                        presentationMode.wrappedValue.dismiss()
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
        .onAppear(perform: inputDataFromViewModel)
    }
}

struct DataAlamatView_Previews: PreviewProvider {
    static var previews: some View {
        DataAlamatView()
    }
}
