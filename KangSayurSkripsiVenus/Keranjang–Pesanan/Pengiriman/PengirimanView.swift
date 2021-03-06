//
//  PengirimanView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PengirimanView: View {
    @EnvironmentObject var cartData: CartData
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        AlamatRow()
                        
                        ScrollView {
                            LazyVStack {
                                ForEach(Array(cartData.order.cart.enumerated()), id: \.1.id) { (index, item) in
                                    PengirimanRow(gambar: item.product.name, nama: item.product.name, harga: item.product.price, quantity: item.quantity)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 0)
                                }
                            }
                            .background(StyleColors.secondaryYellow)
                            .padding(.vertical, 8)
                        }
                        .padding(.vertical, -8)
                        
                        ZStack {
                            VStack {
                                RingkasanRow(quantity: cartData.order.totalOrder, price: cartData.order.totalPrice, priceOngkos: 10000)
                                TotalPembelianRow(isPresented: $isPresented, totalOrder: cartData.order.totalPrice + 10000)
                                    .padding(.top, -7.5)
                            }
                        }
                        .background(StyleColors.captionSmall)
                    }
                }
            }
            .navigationBarTitle("Pengiriman", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                cartData.order.removeOrderData()
                isPresented = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
            }))
            .background(StyleColors.secondaryYellow)
        }
        .accentColor(StyleColors.primaryRed)
    }
}

//struct PengirimanView_Previews: PreviewProvider {
//    static var previews: some View {
//        PengirimanView()
//    }
//}
