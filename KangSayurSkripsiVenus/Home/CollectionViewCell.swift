//
//  CollectionViewCell.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct CollectionViewCell: View {
    @EnvironmentObject var cartData: CartData
    @State var disabled1 : Bool = false
    
    var product: Product
    var index: Int
    
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
                    Image(product.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                }
                
                Group {
                    Text(product.name)
                        .font(Font.custom("Sora-Regular", size: 15))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.vertical, 2)
                    
                    Text(product.stock == 0 ? "Tidak Tersedia" : "Tersedia")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.bottom, 1)
                    
                    Text("Rp\(product.price)/kg")
                        .font(Font.custom("Sora-Bold", size: 12))
                        .foregroundColor(StyleColors.secondaryTitleText)
                        .padding(.bottom, 2)
                }
                .padding(.leading, 8)
                
                Button(action: {
                    //jangan lupa kasih action buat masukkin ke cart
//                    cartData.add(index: index, product: product)
                    cartData.append(product: product)
//                    disabled1 = true
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 33)
                        
                        Text("+ Keranjang")
                            .foregroundColor(Color.white)
                    }
                })
//                .disabled(product.stock == 0 || disabled1)
            }
            .padding()
        }
        .padding(.horizontal, 10)
    }
}

//struct CollectionViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionViewCell(product: Product.example, disabled: <#Binding<Bool>#>, index: 0)
//    }
//}
