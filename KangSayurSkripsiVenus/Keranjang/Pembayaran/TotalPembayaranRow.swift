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
                .frame(width: UIScreen.main.bounds.size.width, height: 65)
            HStack{
                VStack(alignment: .leading){
                    Text("Total Harga")
                   
                }.padding(.leading, 15)
                Spacer()
                Text("Rp.\(totalOrder)")
                    .padding(.trailing, 15)
            }
        }
    }
}


struct TotalPembayaranRow_Previews: PreviewProvider {
    static var previews: some View {
        TotalPembayaranRow(totalOrder: 50000)
    }
}
