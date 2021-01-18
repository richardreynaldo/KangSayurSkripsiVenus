//
//  TestView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import SwiftUI

// MARK: - CartView
struct CartView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cartData: CartData
    @State var stock: Int = 0
//    var product: Product
    
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(Array(cartData.cart.enumerated()), id: \.1.id) { (index, item) in
                    VStack {
                        Text(item.product.name)
                        Text(item.product.desc)
                        Text("Stock: \(item.product.stock)")

                        HStack {
                            Button(action: {
                                print("index: \(index)")
                                cartData.remove(index: index, product: item.product, productData: productData)
                            }, label: {
                                Image(systemName: "minus.circle")
                            })
                            .disabled(cartData.cart[index].quantity == 0 ? true : false)

                            Text("\(cartData.cart[index].quantity)")
                                .underline()

                            Button(action: {
                                print("index: \(index)")
                                cartData.add(index: index, product: item.product, productData: productData)
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                            .disabled(item.product.stock == 0 ? true : false)
                        }
                    }
                    .padding(.bottom, 40)
                }
                Text("Total Price: Rp \(cartData.totalPrice)")
            }
            .onAppear {
                productData.getProductData()
                cartData.getCartData()
            }
        }
    }
}


// MARK: - CategorizationView
struct CategorizationView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cartData: CartData
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
                                        cartData.remove(index: index, product: item, productData: productData)
                                        print("index: \(index)")
                                    }, label: {
                                        Image(systemName: "minus.circle")
                                    })
                                    .disabled(item.stock == stock ? true : false)

                                    Text("\(cartData.totalProduct)")
                                        .underline()

                                    Button(action: {
                                        cartData.add(index: index, product: item,productData: productData)
                                        print("index: \(index)")
                                    }, label: {
                                        Image(systemName: "plus.circle")
                                    })
                                    .disabled(item.stock == 0 ? true : false)
                                }
                            }
                            .padding(.bottom, 40)
                        }
                    }
                }
                Text("Total Price: Rp \(cartData.totalPrice)")
            }
            .onAppear {
                productData.getProductData()
            }
        }
    }
}


// MARK: - ProductView
struct ProductView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cartData: CartData
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
                                cartData.remove(index: index, product: item, productData: productData)
                            }, label: {
                                Image(systemName: "minus.circle")
                            })
                            .disabled(item.stock == cartData.totalProduct ? true : false)

                            Text("\(cartData.totalProduct)")
                                .underline()

                            Button(action: {
                                print("index: \(index)")
                                cartData.add(index: index, product: item, productData: productData)
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                            .disabled(item.stock == 0 ? true : false)
                        }
                    }
                    .padding(.bottom, 40)
                }
                Text("Total Price: Rp \(cartData.totalPrice)")
            }
            .onAppear {
                productData.getProductData()
            }
        }
    }
}


// MARK: - PreviewProvider
struct TestView_Previews: PreviewProvider {
    static let cart = CartData()
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
