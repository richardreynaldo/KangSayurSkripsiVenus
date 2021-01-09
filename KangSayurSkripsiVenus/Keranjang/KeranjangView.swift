//
//  KeranjangView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    CheckView()
                    Text("Pilih semua")
                }.padding(.trailing,250)
                KeranjangRow(nama: "Kangkung", harga: 20000)
                KeranjangRow(nama: "Bayam Hijau", harga: 10000)
                KeranjangRow(nama: "Brokoli",  harga: 15000)
                KeranjangRow(nama: "Tomat", harga: 5000)
                KeranjangRow(nama: "Tauge", harga: 3000)
            }
            //jangan lupa di ganti sama actual total price*quantity terus tambahin
            TotalKeranjangRow(price: 40000)
        }
    }
}

struct KeranjangView_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangView()
    }
}
