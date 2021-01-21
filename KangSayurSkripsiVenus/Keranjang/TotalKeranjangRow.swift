//
//  TotalKeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct TotalKeranjangRow: View {
    @EnvironmentObject var productData: ProductData
    var price: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Harga")
                    Text("Rp\(price)")
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 108, height: 41)
                        
                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
                        Text("Beli(3)")
                            .foregroundColor(Color.white)
                    }
                })
                .padding(.trailing)
            }
        }
    }
}

struct TotalKeranjangRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalKeranjangRow(price: 40000)
    }
}
