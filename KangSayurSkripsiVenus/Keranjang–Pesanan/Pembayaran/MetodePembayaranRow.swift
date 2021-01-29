//
//  MetodePembayaranRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct MetodePembayaranRow: View {
    var paymentType: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 81)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Metode Pembayaran")
                        .font(Font.custom("Sora-Regular", size: 20))
                        .foregroundColor(StyleColors.titleText)
                    
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .scaledToFit()
                            .foregroundColor(StyleColors.titleText)
                        
                        Text("\(paymentType)")
                            .font(Font.custom("Sora-Regular", size: 15))
                            .foregroundColor(StyleColors.titleText)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}


struct MetodePembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        MetodePembayaranRow(paymentType: "Cash on Delivery")
    }
}
