//
//  Order.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class CartData: ObservableObject {
    @Published var cart = [Cart]()
    @Published var orderHeader = OrderHeader()
    
    private var db = Firestore.firestore()
    
    var totalProduct: Int {
        if cart.count > 0 {
            return cart.count
        }
        else {
            return 0
        }
    }
    
    var totalPrice: Int {
        if cart.count > 0 {
            return cart.reduce(0) { $0 + $1.quantity }
        } else {
            return 0
        }
    }
    
    func add(index: Int, product: Product) {
        //        if let index = cart.firstIndex(of: product) {
        if cart[index].product.stock > 0 {
            cart[index].product = product
            cart[index].quantity += 1
//            productData.products[index].stock -= 1
            cart[index].product.stock -= 1
        }
        //        }
        //        orderHeader.totalOrder! += 1
        //        db.collection("Cart").addDocument(data: ["cart" : prdoucts])
    }
    
    func append(product: Product) {
        cart.append(Cart(id: product.id, product: product, quantity: 1))
    }
    
    func remove(index: Int, product: Product) {
        //        if let index = cart.firstIndex(of: product) {
        if cart[index].quantity > 1 {
//            cart.remove(at: index)
            cart[index].quantity -= 1
//            productData.products[index].stock += 1
            cart[index].product.stock += 1
        }
        else if cart[index].quantity == 1 {
            cart[index].product.stock += 1
            cart.remove(at: index)
        }
        //            orderHeader.totalOrder! -= 1
        //            db.collection("Cart").document(product.id).delete() { err in
        //                if let err = err {
        //                    print("Error removing product: \(err)")
        //                } else {
        //                    print("Product successfully removed!")
        //                }
        //            }
        //        }
    }
    
//    func delete(index: Int) {
//        cart[index].product.stock += 1
//        cart.remove(at: index)
//    }
    
    func checkout() {
        db.collection("")
    }
    
    // Temporary Function
    func getCartData() {
        cart.append(Cart(id: "0001", product: Product.example, quantity: 1))
        cart.append(Cart(id: "0002", product: Product.example, quantity: 1))
    }
}
