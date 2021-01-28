//
//  StokRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 28/01/21.
//

import SwiftUI

struct StokRow: View {
    @EnvironmentObject var productData: ProductData
    var product: Product
    var index: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            VStack {
                HStack {
                    // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(Font.custom("Sora-Bold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.top, 10)
                        
                        Text("Rp\(product.price)/kg")
                            .font(Font.custom("Sora-Regular", size: 16))
                            .foregroundColor(StyleColors.titleText)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        productData.products[index].stock -= 1
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .disabled(product.stock == 0)
                    
                    VStack{
                        Text("\(product.stock)")
                            .font(Font.custom("Sora-Regular", size: 12))
                            .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Rectangle()
                            .frame(width: 35, height: 1, alignment: .center)
                    }
                    
                    Button(action: {
                        productData.products[index].stock += 1
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                }
            }
            .padding()
            
        }
    }
}

struct StokRow_Previews: PreviewProvider {
    static var previews: some View {
        StokRow(product: Product.example, index: 0)
    }
}
