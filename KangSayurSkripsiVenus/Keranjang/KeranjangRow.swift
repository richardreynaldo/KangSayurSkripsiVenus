//
//  KeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangRow: View {
    var nama: String
    var harga: Int
    
    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                CheckView()
                
                // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                
                Text("GAMBAR")
                        .font(.title)
                
                VStack(alignment: .leading) {
                    Text("\(nama)")
//                        .font(StyleFont.captionSmall)
                        .fontWeight(.light)
//                        .foregroundColor(StyleColors.accountPageCaptionSmall)
                        .padding(.top, 10)
                    
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

struct KeranjangRow_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangRow(nama: "Kangkung", harga: 20000)
    }
}

struct CheckView: View {
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{ Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}
