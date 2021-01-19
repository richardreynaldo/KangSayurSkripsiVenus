//
//  HomeView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var productData: ProductData
    @State var text = ""
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            VStack{
                SearchBar(text: $text)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productData.products.indices) { index in
                            CollectionViewCell(productName: productData.products[index].name,
                                               productStatus: productData.products[index].stock == 0 ? "Tidak Tersedia" : "Tersedia",
                                               productPrice: productData.products[index].price)
                        }
                    }
                }
            }
        }
        .background(StyleColors.secondaryYellow)
        .onAppear {
            productData.getProductData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
