//
//  DataAlamatView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct DataAlamatView: View {
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
        ZStack {
            ScrollView {
                VStack{
                    ViewBottom(title: "Perumahan", input: $perumahan)
                    //    .padding(.bottom)
                    ViewBottom(title: "Nama Jalan", input: $jalan)
                    //    .padding(.bottom)
                    ViewBottom(title: "Nomor", input: $nomor)
                    //    .padding(.bottom)
                    ViewBottom(title: "RT", input: $rt)
                    //    .padding(.bottom)
                    ViewBottom(title: "RW", input: $rw)
                    //    .padding(.bottom)
                    ViewBottom(title: "Kelurahan", input: $kelurahan)
                    //    .padding(.bottom)
                    ViewBottom(title: "Kecamatan", input: $kecamatan)
                    //    .padding(.bottom)
                    ViewBottom(title: "Kota", input: $kota)
                    //    .padding(.bottom)
                    ViewBottom(title: "Provinsi", input: $provinsi)
                    //    .padding(.bottom)
                    ViewBottom(title: "Kode Pos", input: $kodepos)
                    //    .padding(.bottom)
                }
                .navigationBarTitle("Change Email", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    
                    DispatchQueue.main.async {
                        //masukin func buat gabungin semua alamatnya terus masukkin ke core data
                    }
                    
                }) {
                    Text("Done")
//                        .foregroundColor(StyleColors.primaryRed)
//                        .font(StyleFont.heading2)
                }).padding(.top, 108)
            }
        }
//        .background(StyleColors.secondaryYellow)
        .edgesIgnoringSafeArea(.top)
    }
}

struct DataAlamatView_Previews: PreviewProvider {
    static var previews: some View {
        DataAlamatView()
    }
}
