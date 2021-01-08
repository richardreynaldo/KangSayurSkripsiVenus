//
//  RiwayatRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct RiwayatRow: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                Text("")
                        .font(.title)
                
                VStack(alignment: .leading) {
//                    Text("\(INI HARUSNYA TANGGAL SI PEMESANAN, formatter: Self.dateFormat)")
//                        .font(StyleFont.captionSmall)
//                        .fontWeight(.light)
//                        .foregroundColor(StyleColors.accountPageCaptionSmall)
//                        .padding(.top, 10)
                    
//                   Text("\(INI HARUSNYA NAMA SAYURANNYA)")
//                        .font(StyleFont.heading2)
//                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
                    
//                    Text("\(INI HARUSNYA STATUS SI RIWAYATNYA)")
//                        .font(StyleFont.subtitle)
//                        .fontWeight(.light)
//                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
//                        .padding(.bottom, 14)
                }
                .padding(.leading, 14)
                
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal, 22)
        }
    }
}


struct RiwayatRow_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatRow()
    }
}
