//
//  KeranjangView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangView: View {
    var body: some View {
        GeometryReader{
            geometry in
            VStack{
                Group{
                    HStack{
                        CheckView()
                        Text("Pilih semua")
                            .lineLimit(1)
                            .frame(width: 100,alignment: .leading)
                    }
                }
                .padding(.trailing,150)
                ScrollView{
                    VStack{
                        
                        KeranjangRow(nama: "Kangkung", harga: 20000, gambar: "bell_isle")
                        KeranjangRow(nama: "Bayam Hijau", harga: 10000, gambar: "bell_isle")
                        KeranjangRow(nama: "Brokoli",  harga: 15000, gambar: "bell_isle")
                        KeranjangRow(nama: "Tomat", harga: 5000, gambar: "bell_isle")
                        KeranjangRow(nama: "Tauge", harga: 20000, gambar: "bell_isle")
                    }
                    //jangan lupa di ganti sama actual total price*quantity terus tambahin
                }
                Group{
                    TotalKeranjangRow(price: 40000)
            }
            
//                    .position(x: geometry.size.width/2, y: geometry.size.height/2.9)
            }
        }
        .navigationBarTitle("Keranjang")
        
    }
}

struct KeranjangView_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangView()
    }
}
