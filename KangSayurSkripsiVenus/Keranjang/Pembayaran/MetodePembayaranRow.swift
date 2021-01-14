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
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            HStack{
                VStack(alignment: .leading){
                    Text("Metode Pembayaran")
                        .font(.title2)
                    HStack{
                        Image("bi_cash")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .scaledToFit()
                        Text("\(paymentType)")
                    }
                }.padding(.leading, 15)
                Spacer()
            }
        }
    }
}


struct MetodePembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        MetodePembayaranRow(paymentType: "Cash on Delivery")
    }
}
