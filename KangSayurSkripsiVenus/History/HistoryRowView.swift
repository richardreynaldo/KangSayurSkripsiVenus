//
//  HistoryRowView.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 22/01/21.
//

import SwiftUI

struct HistoryRowView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                
                Text("GAMBAR")
                        .font(.title)
                
                VStack(alignment: .leading) {
                    Text("tanggal")
//                        .font(StyleFont.captionSmall)
                    Text("nama produk")
                        .fontWeight(.light)
                    Text("Status")
//                        .foregroundColor(StyleColors.accountPageCaptionSmall)
                    
//                        .font(StyleFont.heading2)
//                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
                    
                    //kurang yang tempat sampah buat delete sama + - buat quantity
                }
                .padding(.leading, 14)
                
                 Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal, 22)
        }
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView()
    }
}
