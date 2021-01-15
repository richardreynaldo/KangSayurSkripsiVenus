//
//  TestView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cart: Cart
    @State var stock: Int = 0
//    var product: Product
    
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(Array(productData.products.enumerated()), id: \.1.id) { (index, item) in
                    VStack {
                        Text(item.name)
                        Text(item.desc)
                        Text("Stock: \(item.stock)")

                        HStack {
                            Button(action: {
                                print("index: \(index)")
                                cart.remove(index: index, product: item)
                            }, label: {
                                Image(systemName: "minus.circle")
                            })
                            .disabled(item.stock == stock ? true : false)

                            Text("\(cart.totalProduct)")
                                .underline()

                            Button(action: {
                                print("index: \(index)")
                                cart.add(index: index, product: item, productData: productData)
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                            .disabled(item.stock == 0 ? true : false)
                        }

                        Text("Price: Rp \(cart.totalPrice)")
                    }
                    .padding(.bottom, 40)
                }
            }
            .onAppear {
                productData.getProductData()
            }
        }
    }
}

struct CategorizationView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cart: Cart
    @State var stock: Int = 0
    var categories: [String: [Product]] {
        Dictionary(
            grouping: productData.products,
            by: { $0.category }
        )
    }
    
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(Array(categories.keys.enumerated()), id: \.0) { (index, key) in
                    VStack {
                        Text("Category: \(key)")
                            .foregroundColor(.red)
                        ForEach(Array(categories[key]!)) { item in
                            VStack {
                                Text(item.name)
                                Text(item.desc)
                                Text("Stock: \(item.stock)")

                                HStack {
                                    Button(action: {
                                        cart.remove(index: index, product: item)
                                        print("index: \(index)")
                                    }, label: {
                                        Image(systemName: "minus.circle")
                                    })
                                    .disabled(item.stock == stock ? true : false)

                                    Text("\(cart.totalProduct)")
                                        .underline()

                                    Button(action: {
                                        cart.add(index: index, product: item,productData: productData)
                                        print("index: \(index)")
                                    }, label: {
                                        Image(systemName: "plus.circle")
                                    })
                                    .disabled(item.stock == 0 ? true : false)
                                }

                                Text("Price: Rp \(cart.totalPrice)")
                            }
                            .padding(.bottom, 40)
                        }
                    }
                }
            }
            .onAppear {
                productData.getProductData()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static let cart = Cart()
    static let userData = UserData()

    static var previews: some View {
        NavigationView {
            CartView()
                .environmentObject(cart)
                .environmentObject(userData)
                .environmentObject(ProductData())
        }
    }
}
