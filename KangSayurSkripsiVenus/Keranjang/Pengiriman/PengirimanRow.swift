//
//  PengirimanRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PengirimanRow: View {
    var gambar: String
    var nama: String
    var harga: Int
    var quantity: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                Image(gambar)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("\(nama)")
                        .font(Font.custom("Sora-Regular", size: 17))
                        .foregroundColor(StyleColors.titleText)
                    
                    Text("\(quantity) barang(\(quantity)kg)")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.vertical, 1)
                    
                    Text("Rp\(harga)")
                        .font(Font.custom("Sora-Bold", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                    
                    //kurang yang tempat sampah buat delete sama + - buat quantity
                }
                .padding(.leading)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct PengirimanRow_Previews: PreviewProvider {
    static var previews: some View {
        PengirimanRow(gambar: "Brokoli", nama: "Brokoli", harga: 20000, quantity: 2)
    }
}
