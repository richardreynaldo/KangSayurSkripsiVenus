//
//  TotalKeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct TotalKeranjangRow: View {
    @EnvironmentObject var cartData: CartData
    @State private var isPresented: Bool = false
    
    var price: Int
    var qty: Int
    var totalHargaTextColor: Color {
        return cartData.cart.isEmpty ? StyleColors.disabledButtonBg : StyleColors.titleText
    }
    var priceTextColor: Color {
        return cartData.cart.isEmpty ? StyleColors.disabledButtonBg : StyleColors.secondaryTitleText
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Harga")
                        .font(Font.custom("Sora-SemiBold", size: 17, relativeTo: .subheadline))
                        .foregroundColor(totalHargaTextColor)
                    
                    Text("Rp\(price)")
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(priceTextColor)
                }
                .padding(.leading)
                
                Spacer()
                
//                NavigationLink(destination: PengirimanView()) {
//                    ZStack {
//                        Capsule()
//                            .frame(width: 108, height: 41)
//
//                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
//                        Text("Beli(\(qty))")
//                            .font(Font.custom("Sora-Bold", size: 15))
//                            .foregroundColor(Color.white)
//                    }
//                }
//                .padding(.trailing)
                
                Button(action: {
                    cartData.checkout()
                    isPresented = true
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 108, height: 41)
                        
                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
                        Text("Beli (\(qty))")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(Color.white)
                    }
                })
                .padding(.trailing)
                .disabled(cartData.getQuantityCart() == 0)
                .fullScreenCover(isPresented: $isPresented) {
                    PengirimanView(isPresented: $isPresented)
                }
            }
        }
    }
}

struct TotalKeranjangRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalKeranjangRow(price: 40000, qty: 2)
    }
}
