//
//  Order.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class Cart: ObservableObject {
    @Published var productData = ProductData()
    @Published var cart = [Product]()
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
            return cart.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(index: Int, product: Product) {
        //        if let index = cart.firstIndex(of: product) {
        if productData.products[index].stock > 0 {
            cart.append(product)
            productData.products[index].stock -= 1
        }
        //        }
        //        orderHeader.totalOrder! += 1
        //        db.collection("Cart").addDocument(data: ["cart" : prdoucts])
    }
    
    func remove(index: Int, product: Product) {
        //        if let index = cart.firstIndex(of: product) {
        //            if item[index].stock >= 0 {
        cart.remove(at: index)
        //                item[index].stock += 1
        //            }
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
    
    func checkout() {
        db.collection("")
    }
}
