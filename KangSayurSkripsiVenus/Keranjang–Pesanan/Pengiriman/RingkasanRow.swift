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
                .fill(Color.white)
                .frame(height: 81)
            
            VStack(alignment: .leading) {
                Text("Ringkasan belanja")
                    .font(Font.custom("Sora-SemiBold", size: 16))
                    .foregroundColor(StyleColors.titleText)
                    .padding(.bottom, 4)
                    .padding(.horizontal)
                
                HStack {
                    Text("Total Harga(\(quantity) Barang)")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                    
                    Spacer()
                    
                    Text("Rp\(price)")
                        .font(Font.custom("Sora-SemiBold", size: 12))
                        .foregroundColor(StyleColors.titleText)
                }
                .padding(.horizontal)

                HStack {
                    Text("Total Ongkos Kirim")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                    
                    Spacer()
                    
                    Text("Rp\(priceOngkos)")
                        .font(Font.custom("Sora-SemiBold", size: 12))
                        .foregroundColor(StyleColors.titleText)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RingkasanRow_Previews: PreviewProvider {
    static var previews: some View {
        RingkasanRow(quantity: 3, price: 20000, priceOngkos: 10000)
    }
}
