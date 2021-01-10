//
//  PengirimanView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PengirimanView: View {
    var body: some View {
        GeometryReader{
            geometry in
            VStack{
                Group{
                    
                }
                ScrollView{
                    AlamatRow()
                        .padding(.bottom, 15)
                    VStack{
                        PengirimanRow(nama: "Brokoli", harga: 20000, quantity: 1)
                        PengirimanRow(nama: "Bayam Merah", harga: 20000, quantity: 2)
                    }
                   
                }
                Group{
                    RingkasanRow(quantity: 3, price: 40000, priceOngkos: 10000)
                    TotalPembelianRow(totalOrder: 50000)
                }
            }
        }
        .navigationBarTitle("Pengiriman")
        
    }
}

struct PengirimanView_Previews: PreviewProvider {
    static var previews: some View {
        PengirimanView()
    }
}
