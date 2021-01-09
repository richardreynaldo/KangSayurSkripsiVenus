//
//  RingkasanRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct RingkasanRow: View {
    var quantity: Int
    var price: Int
    var priceOngkos: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .frame(width: UIScreen.main.bounds.size.width, height: 106)
            VStack(alignment: .leading){
                Text("Ringkasan belanja")
                    .font(.title3)
                    .padding(.bottom, 5)
                    .padding([.leading, .trailing], 5)
                
                HStack{
                    Text("Total Harga(\(quantity) Barang)")
                    Spacer()
                    Text("Rp.\(price)")
                }.padding([.leading, .trailing], 5)

                HStack{
                    Text("Total Ongkos Kirim")
                    Spacer()
                    Text("Rp.\(priceOngkos)")
                }.padding([.leading, .trailing], 5)
            }
        }
    }
}

struct RingkasanRow_Previews: PreviewProvider {
    static var previews: some View {
        RingkasanRow(quantity: 3, price: 20000, priceOngkos: 10000)
    }
}
