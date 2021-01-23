//
//  DetailPembayaranView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct DetailPembayaranRow: View {
    var price: Int
    var priceOngkos: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(height: 106)
            
            VStack(alignment: .leading){
                Text("Detail pembayaran")
                    .font(Font.custom("Sora-SemiBold", size: 20))
                    .foregroundColor(StyleColors.titleText)
                    .padding(.bottom, 4)
                    .padding(.horizontal)
                
                HStack{
                    Text("Total Harga")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                    
                    Spacer()
                    
                    Text("Rp\(price)")
                        .font(Font.custom("Sora-SemiBold", size: 12))
                        .foregroundColor(StyleColors.titleText)
                }
                .padding(.horizontal)

                HStack{
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

struct DetailPembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailPembayaranRow(price: 40000, priceOngkos: 10000)
    }
}
