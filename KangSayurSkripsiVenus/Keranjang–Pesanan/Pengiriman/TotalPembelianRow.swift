//
//  TotalPembelianRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct TotalPembelianRow: View {
    @Binding var isPresented: Bool
    var totalOrder: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(height: 65)
            
            HStack{
                VStack(alignment: .leading) {
                    Text("Total Pembelian")
                        .font(Font.custom("Sora-SemiBold", size: 17))
                        .foregroundColor(StyleColors.titleText)
                    
                    Text("Rp\(totalOrder)")
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                }
                .padding(.leading)
                
                Spacer()
                
                NavigationLink(destination: PembayaranView(isPresented: $isPresented)) {
                    ZStack {
                        Capsule()
                            .frame(width: 160, height: 41)
                        
                        Text("Pilih pembayaran")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.trailing)
                
//                Button(action: {
//                }, label: {
//                    ZStack {
//                        Capsule()
//                            .frame(width: 160, height: 41)
//                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
//                        Text("Pilih pembayaran")
//                            .foregroundColor(Color.white)
//                    }
//                })
//                .padding(.trailing, 15)
            }
        }
    }
}

//struct TotalPembelianRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TotalPembelianRow(totalOrder: 50000)
//    }
//}
