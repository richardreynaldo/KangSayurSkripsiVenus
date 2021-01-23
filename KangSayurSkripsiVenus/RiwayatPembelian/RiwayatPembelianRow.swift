//
//  RiwayatPembelianRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 22/01/21.
//

import SwiftUI

struct RiwayatPembelianRow: View {
    var image: String
    var date: Date
    var name: String
    var status: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                
                Text("\(image)")
                        .font(.title)
                
                VStack(alignment: .leading) {
                    Text("\(date)")
//                        .font(StyleFont.captionSmall)
                    Text("\(name)")
                        .fontWeight(.light)
                    Text("\(String(status))")
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

//struct RiwayatPembelianRow_Previews: PreviewProvider {
//    static var previews: some View {
//        RiwayatPembelianRow()
//    }
//}