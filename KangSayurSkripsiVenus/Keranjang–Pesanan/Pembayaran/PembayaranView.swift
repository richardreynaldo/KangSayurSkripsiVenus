//
//  PembayaranView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PembayaranView: View {
    @EnvironmentObject var cartData: CartData
    @State private var showingAlert: Bool = false
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        VStack(spacing:0) {
                            BarangDiBeliRow()
                            
                            Divider()
                            
                            AlamatRow()
                            
                            Divider()
                            
                            DetailPembayaranRow(price: cartData.order.totalPrice, priceOngkos: 10000)
                            
                            Divider()
                            
                            MetodePembayaranRow(paymentType: cartData.order.paymentType)
                            
                            Divider()
                        }
                        .padding(.bottom, 8)
                    }
                    .background(StyleColors.secondaryYellow)
                    .padding(.bottom, -8)
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            TotalPembayaranRow(totalOrder: cartData.order.totalPrice + 10000)
                            
                            ZStack {
                                Button(action: {
                                    showingAlert = true
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
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Success"), message: Text("Order Placed!"), dismissButton: .default(Text("OK"), action: {
                                        DispatchQueue.main.async {
                                            cartData.appendCartToFirebase()
                                            isPresented = false
                                        }
                                    }))
                                }
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
