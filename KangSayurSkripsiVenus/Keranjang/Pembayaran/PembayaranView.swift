//
//  PembayaranView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PembayaranView: View {
    var body: some View {
        ScrollView{
            VStack{
                BarangDiBeliRow(quantity: 2, price: 20000, quantityxprice: 40000, nama: "Brokoli")
                AlamatRow()
                DetailPembayaranRow(price: 40000, priceOngkos: 10000)
                MetodePembayaranRow(paymentType: "Cash on Delivery")
                TotalPembayaranRow(totalOrder: 50000)
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
}

struct PembayaranView_Previews: PreviewProvider {
    static var previews: some View {
        PembayaranView()
    }
}
