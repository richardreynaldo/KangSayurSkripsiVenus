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
        if cart[index].product.stock > 0 {
            cart[index].product = product
            cart[index].quantity += 1
//            productData.products[index].stock -= 1
//            cart[index].product.stock -= 1
        }
        //        orderHeader.totalOrder! += 1
    }
    
    func append(product: Product) {
        cart.append(Cart(id: product.id, product: product, quantity: 1, dateTime: Date(),status: false))
    }
    
    func remove(index: Int, product: Product) {
        //        if let index = cart.firstIndex(of: product) {
        if cart[index].quantity > 1 {
//            cart.remove(at: index)
            cart[index].quantity -= 1
//            productData.products[index].stock += 1
//            cart[index].product.stock += 1
        }
        else if cart[index].quantity == 1 {
//            cart[index].product.stock += 1
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
    
    func delete(index: Int) {
        cart.remove(at: index)
    }
    
    func checkout() {
        db.collection("")
    }
    
    func getQuantityCart()-> Int {
        var total = 0
        for i in cart {
            total += i.quantity
        }
        return total
    }
    
    func getTotalPriceCart()-> Int {
        var total = 0
        for i in cart{
            total += (i.quantity * i.product.price)
        }
        print("asu\(total)")
        return total
    }
    
    func appendCartToFirebase() {
        var ref: DocumentReference? = nil
        
        for i in cart {
            ref = db.collection("Cart").addDocument(data: [
                "productId": i.product.id,
                "quantity": i.quantity,
                "userId" : globalUserID,
                "dateTime" : i.dateTime,
                "status" : i.status
            ]) { err in
                if let err = err {
                    print("Error adding Cart: \(err)")
                } else {
                    print("Cart added with ID: \(ref!.documentID)")
                }
            }
            print("CEK123\(i.quantity) Ini stock \(i.product.stock)")
            
            db.collection("Product").document(i.product.id).updateData([
                "stock": i.product.stock - i.quantity
            ])
        }
        cart.removeAll()
    }
    
    
    
//    func appendCartToHistory(cartData:CartData) {
//        var ref: DocumentReference? = nil
//        for i in cartData. {
//            ref = db.collection("History").addDocument(data: [
//                "cartItem": i.cartData,
//                "totalCart": cartData.getQuantityCart(),
//                "userId" : globalUserID
//            ]) { err in
//                if let err = err {
//                    print("Error adding Cart: \(err)")
//                } else {
//                    print("Cart added with ID: \(ref!.documentID)")
//                }
//            }
//        }
//
//    }
    
    // Temporary Function
//    func getCartData() {
//        cart.append(Cart(id: "0001", product: Product.example, quantity: 1))
//        cart.append(Cart(id: "0002", product: Product.example, quantity: 1))
//    }
}
