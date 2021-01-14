//
//  CollectionViewCell.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct CollectionViewCell: View {
    static let row = 2
    static let column = 9
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 152, height: 239)
                .foregroundColor(.gray)
            VStack{
                //jangan lupa taro gambar
                Text("Brokoli")
                Text("Status")
                Text("Harga")
                Button(action: {
                    //jangan lupa kasih action buat masukkin ke cart
                }, label: {
                    ZStack {
                        Capsule()
                            .frame(width: 134, height: 33, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        Text("+ Keranjang")
                            .foregroundColor(Color.white)
                    }
                })
            }
        }
    }
}

struct CollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewCell()
    }
}
