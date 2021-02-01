//
//  StokView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 28/01/21.
//

import SwiftUI

struct StokView: View {
    @EnvironmentObject var productData: ProductData
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
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
                    
                    UpdateStokRow(isLoading: $isLoading, qty: productData.getProductStock())
                }
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)
                
                if isLoading {
                    Rectangle()
                        .fill(Color.white.opacity(0.75))
                        .cornerRadius(15)
                        .shadow(color: Color(.lightGray), radius: 4, x: 0.0, y: 0.0)
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 5)
                    
                    ProgressView("Updating...")
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: StyleColors.primaryRed))
                        .foregroundColor(StyleColors.primaryRed)
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
