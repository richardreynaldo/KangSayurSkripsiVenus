//
//  TotalPembayaranRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct TotalPembayaranRow: View {
    var totalOrder: Int
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(height: 65)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Harga")
                        .font(Font.custom("Sora-SemiBold", size: 17))
                        .foregroundColor(StyleColors.titleText)
                }
                
                Spacer()
                
                Text("Rp\(totalOrder)")
                    .font(Font.custom("Sora-Regular", size: 17))
                    .foregroundColor(StyleColors.titleText)
            }
            .padding(.horizontal)
        }
    }
}


struct TotalPembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalPembayaranRow(totalOrder: 50000)
    }
}
