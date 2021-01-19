//
//  KeranjangView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

var total : Int = 0

struct KeranjangView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Group {
                        HStack {
                            CheckView()
                            Text("Pilih semua")
                                .lineLimit(1)
                                .frame(width: 100,alignment: .leading)
                            
                        }
                    }
                    .padding(.trailing,240)
                    ScrollView {
                        VStack {
                            KeranjangRow(nama: "Kangkung", harga: 20000, gambar: "bell_isle")
                                .frame(width: geometry.size.width * 0.91, height: geometry.size.height * 0.11, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            KeranjangRow(nama: "Bayam Hijau", harga: 10000, gambar: "bell_isle")
                                .frame(width: geometry.size.width * 0.91, height: geometry.size.height * 0.11, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            KeranjangRow(nama: "Brokoli",  harga: 15000, gambar: "bell_isle")
                                .frame(width: geometry.size.width * 0.91, height: geometry.size.height * 0.11, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            KeranjangRow(nama: "Tomat", harga: 5000, gambar: "bell_isle")
                                .frame(width: geometry.size.width * 0.91, height: geometry.size.height * 0.11, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            KeranjangRow(nama: "Tauge", harga: 20000, gambar: "bell_isle")
                                .frame(width: geometry.size.width * 0.91, height: geometry.size.height * 0.11, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                        }
                        
                        //jangan lupa di ganti sama actual total price*quantity terus tambahin
                    }
                    Group {
                        TotalKeranjangRow(price: total)
                }
                
    //                    .position(x: geometry.size.width/2, y: geometry.size.height/2.9)
                }
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}

struct KeranjangView_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangView()
    }
}
