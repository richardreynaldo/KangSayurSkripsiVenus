//
//  TestView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 12/01/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var cart: Cart
    @State var stock: Int = 0
    var product: Product
    
    var body: some View {
        LazyVStack {
            ForEach(cart.item, id: \.id) { item in
                VStack {
                    Text(item.name)
                    Text(item.desc)
                    Text("Stock: \(item.stock)")

                    HStack {
                        Button(action: {
                            cart.remove(product: product)
                        }, label: {
                            Image(systemName: "minus.circle")
                        })
                        .disabled(item.stock == stock ? true : false)

                        Text("\(cart.totalProduct)")
                            .underline()

                        Button(action: {
                            cart.add(product: product)
                        }, label: {
                            Image(systemName: "plus.circle")
                        })
                        .disabled(item.stock == 0 ? true : false)
                    }

                    Text("Price: Rp \(cart.totalPrice)")
                }
//                .onAppear {
//                    stock = item.stock
//                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static let cart = Cart()
    static let userData = UserData()
    
    static var previews: some View {
        NavigationView {
            TestView(product: Product.example)
                .environmentObject(cart)
                .environmentObject(userData)
        }
    }
}
