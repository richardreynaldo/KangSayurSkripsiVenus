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
        VStack {
            Text(cart.item.name)
            Text(cart.item.desc)
            Text("Stock: \(cart.item.stock)")
            
            HStack {
                Button(action: {
                    cart.remove(product: product)
                }, label: {
                    Image(systemName: "minus.circle")
                })
                .disabled(cart.item.stock == stock ? true : false)
                
                Text("\(cart.totalProduct)")
                    .underline()
                
                Button(action: {
                    cart.add(product: product)
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .disabled(cart.item.stock == 0 ? true : false)
            }
            
            Text("Price: Rp \(cart.totalPrice)")
        }
        .onAppear {
            stock = cart.item.stock
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
