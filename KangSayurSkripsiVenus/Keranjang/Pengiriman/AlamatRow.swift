//
//  AlamatRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct AlamatRow: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 160)
            VStack(alignment: .leading){
                Text("Alamat Pengiriman")
                    .font(.title)
                    .padding([.top, .bottom, .trailing], 5)
                Text("Perumahan Bumi Permai, Jalan Gondang Jati 17, RT 09 RW 03, Kelurahan Kaliran, Kecamatan Kaliwangi, Kota Malang, Jawa Timur, 224352")
                    .padding([.top, .bottom, .trailing], 5)
            }
        }
    }
}

struct AlamatRow_Previews: PreviewProvider {
    static var previews: some View {
        AlamatRow()
    }
}
