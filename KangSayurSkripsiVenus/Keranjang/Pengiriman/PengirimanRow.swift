//
//  PengirimanRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct PengirimanRow: View {
    var nama: String
    var harga: Int
    var quantity: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                
                Text("GAMBAR")
                        .font(.title)
                
                VStack(alignment: .leading) {
                    Text("\(nama)")
//                        .font(StyleFont.captionSmall)
                    Text("\(quantity) barang(\(quantity)kg)")
                        .fontWeight(.light)
//                        .foregroundColor(StyleColors.accountPageCaptionSmall)
                    
                    Text("Rp.\(harga)")
//                        .font(StyleFont.heading2)
//                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
                    
                    //kurang yang tempat sampah buat delete sama + - buat quantity
                }
                .padding(.leading, 14)
                
                 Spacer()
            }
            .padding(.horizontal, 22)
        }
    }
}

struct PengirimanRow_Previews: PreviewProvider {
    static var previews: some View {
        PengirimanRow(nama: "Brokoli", harga: 20000, quantity: 2)
    }
}
