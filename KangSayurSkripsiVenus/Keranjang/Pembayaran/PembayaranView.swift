//
//  PembayaranView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PembayaranView: View {
    var body: some View {
        GeometryReader{
            geometry in
            VStack{
                ScrollView{
                    VStack(spacing:0){
                        BarangDiBeliRow(quantity: 2, price: 20000, quantityxprice: 40000, nama: "Brokoli")
                        Rectangle()
                            .frame(height: 1)
                        AlamatRow()
                        Rectangle()
                            .frame(height: 1)
                        DetailPembayaranRow(price: 40000, priceOngkos: 10000)
                        Rectangle()
                            .frame(height: 1)
                        MetodePembayaranRow(paymentType: "Cash on Delivery")
                        Rectangle()
                            .frame(height: 1)
                        
                        
                    }
                }
                Group{
                    
                    TotalPembayaranRow(totalOrder: 50000)
                    Rectangle()
                        .frame(height: 1)
                    Button(action: {
                    }, label: {
                        ZStack {
                            Capsule()
                                .frame(height: 52)
                            
                            Text("Bayar")
                                .foregroundColor(Color.white)
                        }
                    })
                }
            }
        }
        .navigationBarTitle("Pembayaran")
        
    }
}

struct PembayaranView_Previews: PreviewProvider {
    static var previews: some View {
        PembayaranView()
    }
}
