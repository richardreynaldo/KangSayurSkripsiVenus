//
//  HomeView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cartData: CartData
    @State var text = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            VStack{
                SearchBar(text: $text)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productData.products.indices, id: \.self) { index in
                            CollectionViewCell(product: productData.products[index], index: index)
                                .onTapGesture {
                                    print("\(cartData.cart.first(where: {$0.product.name == productData.products[index].name}))")
                                }
                        }
                    }
                }
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
