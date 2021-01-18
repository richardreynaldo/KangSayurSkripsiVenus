//
//  TotalKeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct TotalKeranjangRow: View {
    var price: Int
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            HStack{
                VStack(alignment: .leading){
                    Text("Total Harga")
                    Text("Rp.\(price)")
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(height: 52)
                            .frame(width: 108, height: 41)
                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
                        Text("Beli(3)")
                            .foregroundColor(Color.white)
                    }
                }).padding(.trailing, 15)
            }
        }
    }
}

struct TotalKeranjangRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalKeranjangRow(price: 40000)
    }
}
