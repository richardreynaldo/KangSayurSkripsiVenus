//
//  Order.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation
import FirebaseFirestore

class Cart: ObservableObject {
    @Published var item = Product()
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
    
    func add(product: Product) {
        if item.stock > 0 {
            cart.append(product)
            item.stock -= 1
        }
//        orderHeader.totalOrder! += 1
//        db.collection("Cart").addDocument(data: ["cart" : prdoucts])
    }
    
    func remove(product: Product) {
        if let index = cart.firstIndex(of: product) {
            if item.stock >= 0 {
                cart.remove(at: index)
                item.stock += 1 
            }
//            orderHeader.totalOrder! -= 1
//            db.collection("Cart").document(product.id).delete() { err in
//                if let err = err {
//                    print("Error removing product: \(err)")
//                } else {
//                    print("Product successfully removed!")
//                }
//            }
        }
    }
    
    func checkout() {
        db.collection("")
    }
}
