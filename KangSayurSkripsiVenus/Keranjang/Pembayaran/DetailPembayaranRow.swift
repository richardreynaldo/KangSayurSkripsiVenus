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
                .frame(width: UIScreen.main.bounds.size.width, height: 106)
            VStack(alignment: .leading){
                Text("Detail pembayaran")
                    .font(.title3)
                    .padding(.bottom, 5)
                    .padding([.leading, .trailing], 5)
                
                HStack{
                    Text("Total Harga")
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

struct DetailPembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailPembayaranRow(price: 40000, priceOngkos: 10000)
    }
}
