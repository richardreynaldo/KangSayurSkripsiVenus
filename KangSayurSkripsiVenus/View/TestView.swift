//
//  TestView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var cart: Cart
    @State var stock: Int = 0
//    var product: Product
    var categories: [String: [Product]] {
        Dictionary(
            grouping: productData.products,
            by: { $0.category }
        )
    }
    
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    VStack {
                        Text("Category: \(key)")
                            .foregroundColor(.red)
                        ForEach(categories[key]!) { item in
                            VStack {
                                Text(item.name)
                                Text(item.desc)
                                Text("Stock: \(item.stock)")

                                HStack {
                                    Button(action: {
                                        cart.remove(product: item)
                                    }, label: {
                                        Image(systemName: "minus.circle")
                                    })
                                    .disabled(item.stock == stock ? true : false)

                                    Text("\(cart.totalProduct)")
                                        .underline()

                                    Button(action: {
                                        cart.add(product: item)
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
            TestView()
                .environmentObject(cart)
                .environmentObject(userData)
                .environmentObject(ProductData())
        }
    }
}
