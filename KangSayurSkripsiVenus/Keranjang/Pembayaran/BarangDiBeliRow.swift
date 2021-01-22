//
//  BarangDiBeliView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct BarangDiBeliRow: View {
    @EnvironmentObject var cartData: CartData
    
    var quantity: Int
    var price: Int
    var quantityxprice: Int
    var nama: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(minHeight: 106)
            
            VStack(alignment: .leading) {
                Text("Barang yang di beli")
                    .font(Font.custom("Sora-SemiBold", size: 20))
                    .foregroundColor(StyleColors.titleText)
                    .padding(.bottom, 4)
                
                //vstack yang ini harusnya di loop sesuai belanjaannya apa aja
                LazyVStack(alignment: .leading) {
                    ForEach(cartData.cart) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(item.product.name)")
                                    .font(Font.custom("Sora-Regular", size: 15))
                                    .foregroundColor(StyleColors.titleText)
                                
                                Text("\(item.quantity) x \(item.product.price)")
                                    .font(Font.custom("Sora-Regular", size: 12))
                                    .foregroundColor(StyleColors.titleText)
                            }
                            .padding(.bottom, 4)
                            
                            Spacer()
                            
                            Text("Rp\(item.quantity * item.product.price)")
                                .font(Font.custom("Sora-SemiBold", size: 12))
                                .foregroundColor(StyleColors.titleText)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
struct BarangDiBeliView_Previews: PreviewProvider {
    static var previews: some View {
        BarangDiBeliRow(quantity: 1, price: 20000, quantityxprice: 20000, nama: "Brokoli")
    }
}
