//
//  TotalPembelianRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct TotalPembelianRow: View {
    var totalOrder: Int
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            HStack{
                VStack(alignment: .leading){
                    Text("Total Harga")
                    Text("Rp.\(totalOrder)")
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(height: 52)
                            .frame(width: 160, height: 41)
                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
                        Text("Pilih pembayaran")
                            .foregroundColor(Color.white)
                    }
                }).padding(.trailing, 15)
            }
        }
    }
}

struct TotalPembelianRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalPembelianRow(totalOrder: 50000)
    }
}
