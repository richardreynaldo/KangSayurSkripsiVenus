//
//  KeranjangView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

var total : Int = 0

struct KeranjangView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cartData: CartData
    
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
                        LazyVStack {
                            ForEach(Array(cartData.cart.enumerated()), id: \.1.id) { (index, item) in
                                KeranjangRow(product: item.product, cart: item, index: index)
                                    .padding(.horizontal)
                                    .onTapGesture(perform: {
                                        print("cok \(item.id)")
                                    })
                                    .padding(.vertical, 4)
                            }
                        }
                        //jangan lupa di ganti sama actual total price*quantity terus tambahin
                    }
                    
                    TotalKeranjangRow(price: cartData.getTotalPriceCart(),qty: cartData.getQuantityCart())
                }
            }
            .background(StyleColors.secondaryYellow)
//            .onAppear {
//                productData.getProductData()
//                cartData.getCartData()
//                productData.appendToFirebase()
//            }
        }
    }
}
    
struct KeranjangView_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangView()
    }
}
