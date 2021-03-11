//
//  RiwayatPembelianRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 22/01/21.
//

import SwiftUI

struct RiwayatRow: View {
    var history: History
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "d MMMM yyyy, h:mm a"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                
                Image(history.product.name)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text("\(history.dateTime, formatter: Self.dateFormat)")
                        .font(Font.custom("Sora-Light", size: 10))
                        .foregroundColor(StyleColors.captionSmall)
                        .padding(.top, 10)
                    
                    Text("\(history.product.name)")
                        .font(Font.custom("Sora-Bold", size: 15))
                        .foregroundColor(StyleColors.titleText)
                    
                    Text("Status: \(history.status ? "Delivered" : "Preparing")")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.bottom, 14)
                    
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

struct RiwayatRow_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatRow(history: History.example)
    }
}
