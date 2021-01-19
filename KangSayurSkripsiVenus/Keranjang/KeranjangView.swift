//
//  KeranjangView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

var total : Int = 0

struct KeranjangView: View {
    @EnvironmentObject var cartData: CartData
    @EnvironmentObject var productData: ProductData
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        CheckView()
                        Text("Pilih semua")
                            .lineLimit(1)
                            .frame(width: 100,alignment: .leading)
                        
                    }
                    .padding(.top)
                    .padding(.trailing,240)
                    
                    ScrollView {
                        ForEach(Array(cartData.cart.enumerated()), id: \.1.id) { (index, item) in
                            VStack {
                                KeranjangRow(nama: item.product.name, harga: item.product.price, gambar: "bell_isle")
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                            }
                        }
                        
                        //jangan lupa di ganti sama actual total price*quantity terus tambahin
                    }
                    
                    TotalKeranjangRow(price: total)
                }
            }
            .background(StyleColors.secondaryYellow)
//            .onAppear {
//                productData.getProductData()
//                cartData.getCartData()
//            }
        }
    }
}
    
struct KeranjangView_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangView()
    }
}
