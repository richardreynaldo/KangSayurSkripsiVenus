//
//  UpdateStokRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 28/01/21.
//

import SwiftUI

struct UpdateStokRow: View {
    @EnvironmentObject var productData: ProductData
    var qty: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Barang")
                        .font(Font.custom("Sora-SemiBold", size: 17, relativeTo: .subheadline))
                        .foregroundColor(StyleColors.titleText)
                    
                    Text("\(qty)")
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    DispatchQueue.main.async {
                        productData.updateProductStock()
                    }
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 128, height: 41)
                        
                        //jangan lupa di ganti jadi total dari quantity barang yang di beli 3 nya
                        Text("Update Stok")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(Color.white)
                    }
                })
                .padding(.trailing)
            }
        }
    }
}

//struct UpdateStokRow_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateStokRow(qty: 10)
//    }
//}
