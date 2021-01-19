//
//  CollectionViewCell.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct CollectionViewCell: View {
    var productName: String
    var productStatus: String
    var productPrice: Int
    
    static let row = 2
    static let column = 9
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    //jangan lupa taro gambar
                    Image(systemName: "flame")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                }
                
                Group {
                    Text(productName)
                        .font(Font.custom("Sora-Regular", size: 15))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.vertical, 2)
                    
                    Text(productStatus)
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.bottom, 1)
                    
                    Text("Rp\(productPrice)/kg")
                        .font(Font.custom("Sora-Bold", size: 12))
                        .foregroundColor(StyleColors.secondaryTitleText)
                        .padding(.bottom, 2)
                }
                .padding(.leading, 8)
                
                Button(action: {
                    //jangan lupa kasih action buat masukkin ke cart
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 33)
                        
                        Text("+ Keranjang")
                            .foregroundColor(Color.white)
                    }
                })
            }
            .padding()
        }
        .padding(.horizontal, 10)
    }
}

struct CollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewCell(productName: "Brokoli", productStatus: "Tersedia", productPrice: 20000)
    }
}
