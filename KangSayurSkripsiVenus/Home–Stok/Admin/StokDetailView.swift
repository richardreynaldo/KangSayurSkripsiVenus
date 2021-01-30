//
//  StokDetailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 28/01/21.
//

import SwiftUI

struct StokDetailView: View {
    @EnvironmentObject var productData: ProductData
    var product: Product
    
    @State private var namaProduk: String = ""
    @State private var hargaProduk: String = ""
    @State private var stockProduk: String = ""
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack (alignment: .center) {
                    //INI DI TENGAH TARO GAMBAR PRODUK AJA
                    Image(product.name)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text("Informasi Produk")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Divider()
                        
                        Group {
                            HStack {
                                Text("Nama Produk")
                                    .font(Font.custom("Sora-SemiBold", size: 15))
                                    .foregroundColor(StyleColors.titleText)
                                
                                Spacer()
                            }
                            .padding(.top)
                            
                            TextField("Nama Produk", text: $namaProduk)
                                .keyboardType(.default)
                                .disableAutocorrection(true)
                                .font(Font.custom("Sora-Regular", size: 15))
                                .foregroundColor(StyleColors.secondaryTitleText)
                            
                            Divider()
                        }
                        
                        Group {
                            HStack {
                                Text("Stok Produk")
                                    .font(Font.custom("Sora-SemiBold", size: 15))
                                    .foregroundColor(StyleColors.titleText)
                                
                                Spacer()
                            }
                            .padding(.top)
                            
                            
                            
//                            TextField("Stok", value: $stokProduk, formatter: NumberFormatter())
//
//                                .keyboardType(.decimalPad)
//                                .disableAutocorrection(true)
//                                .font(Font.custom("Sora-Regular", size: 15))
//                                .foregroundColor(StyleColors.secondaryTitleText)
//
                            TextField("Stok", text: $stockProduk)
                                .keyboardType(.decimalPad)
                                .disableAutocorrection(true)
                                .font(Font.custom("Sora-Regular", size: 15))
                                .foregroundColor(StyleColors.secondaryTitleText)
                            
                            
                            Divider()
                        }
                        
                        Group {
                            HStack {
                                Text("Harga Produk")
                                    .font(Font.custom("Sora-SemiBold", size: 15))
                                    .foregroundColor(StyleColors.titleText)
                                
                                Spacer()
                            }
                            .padding(.top)
                            
                            TextField("Harga", text: $hargaProduk)
                                .keyboardType(.decimalPad)
                                .disableAutocorrection(true)
                                .font(Font.custom("Sora-Regular", size: 15))
                                .foregroundColor(StyleColors.secondaryTitleText)
                            
                            Divider()
                        }
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .background(StyleColors.secondaryYellow)
        .navigationTitle(product.name)
        .navigationBarItems(trailing: Button(action: {
            
            
            productData.updateProductData(product: product, name: namaProduk, price: Int(hargaProduk) ?? 0, stock: Int(stockProduk) ?? 0)
        }, label: {
            Text("Save")
        }))
        .onAppear {
            namaProduk = product.name
            hargaProduk = String(product.price)
            stockProduk = String(product.stock)
            print("Product ID: \(product.id)")
        }
    }
}

struct StokDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StokDetailView(product: Product.example)
    }
}
