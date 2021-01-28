//
//  StokView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 28/01/21.
//

import SwiftUI

struct StokView: View {
    @EnvironmentObject var productData: ProductData
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(Array(productData.products.enumerated()), id: \.1.id) { (index, item) in
                                NavigationLink(destination: StokDetailView(product: item)) {
                                    StokRow(product: item, index: index)
                                        .padding(.horizontal)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                        //jangan lupa di ganti sama actual total price*quantity terus tambahin
                    }
                    .padding(.bottom, -8)
                    
                    UpdateStokRow(qty: productData.getProductStock())
                }
            }
            .background(StyleColors.secondaryYellow)
            .onAppear {
                DispatchQueue.main.async {
                    productData.getProductData()
                }
            }
        }
    }
}

struct StokView_Previews: PreviewProvider {
    static var previews: some View {
        StokView()
    }
}
