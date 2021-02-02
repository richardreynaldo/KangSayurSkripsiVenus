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
    @State var isAllChecked: Bool = false
    
    var textColor: Color {
        return cartData.cart.isEmpty ? StyleColors.disabledButtonBg : StyleColors.titleText
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    CheckAllView(isAllChecked: $isAllChecked)
                    Text("Pilih semua")
                        .font(Font.custom("Sora-Bold", size: 17))
                        .foregroundColor(textColor)
                }
                .padding(.top)
                .padding(.trailing,240)
                
                ScrollView {
                    LazyVStack {
                        ForEach(Array(cartData.cart.enumerated()), id: \.1.id) { (index, item) in
                            KeranjangRow(isAllChecked: $isAllChecked, product: item.product, cart: item, index: index)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .padding(.bottom, -8)
                
                TotalKeranjangRow(price: cartData.getTotalPriceCart(), qty: cartData.getQuantityCart())
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
