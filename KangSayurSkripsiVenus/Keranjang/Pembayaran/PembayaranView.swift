//
//  PembayaranView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PembayaranView: View {
    @EnvironmentObject var cartData: CartData
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        VStack(spacing:0) {
                            BarangDiBeliRow(quantity: 2, price: 20000, quantityxprice: 40000, nama: "Brokoli")
                            
                            Divider()
                            
                            AlamatRow()
                            
                            Divider()
                            
                            DetailPembayaranRow(price: cartData.getTotalPriceCart(), priceOngkos: 10000)
                            
                            Divider()
                            
                            MetodePembayaranRow(paymentType: "Cash on Delivery")
                            
                            Divider()
                        }
                        .padding(.bottom, 8)
                    }
                    .background(StyleColors.secondaryYellow)
                    .padding(.bottom, -8)
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            TotalPembayaranRow(totalOrder: cartData.getTotalPriceCart() + 10000)
                            
                            ZStack {
                                Button(action: {
                                    DispatchQueue.main.async {
                                        cartData.appendCartToFirebase()
                                        isPresented = false
                                    }
                                }, label: {
                                    ZStack {
                                        Capsule()
                                            .frame(height: 41)
                                        
                                        Text("Bayar")
                                            .font(Font.custom("Sora-Bold", size: 15))
                                            .foregroundColor(Color.white)
                                    }
                                })
                                .padding()
                            }
                            .background(Color.white)
                            .padding(.top, -7.5)
                        }
                    }
                    .background(StyleColors.captionSmall)
                }
            }
        }
        .navigationBarTitle("Pembayaran")
        .background(StyleColors.secondaryYellow)
    }
}

//struct PembayaranView_Previews: PreviewProvider {
//    static var previews: some View {
//        PembayaranView()
//    }
//}
