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
    @Published var order = Order()
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
        }
    }
    
    func append(product: Product) {
        cart.append(Cart(id: product.id, product: product, quantity: 1, dateTime: Date(), isChecked: false, status: false))
    }
    
    func remove(index: Int, product: Product) {
        if cart[index].quantity > 1 {
            cart[index].quantity -= 1
        }
        else if cart[index].quantity == 1 {
            cart.remove(at: index)
        }
    }
    
    func delete(index: Int) {
        cart.remove(at: index)
    }
    
    func checkout() {
        for item in cart {
            if item.isChecked {
//                order.id = UUID().uuidString
                order.orderDate = Date()
                order.paymentType = "Cash on Delivery"
                order.status = false
                order.totalOrder = getQuantityCart()
                order.totalPrice = getTotalPriceCart()
                order.cart.append(item)
                print("Orders: \(order.cart)")
            }
        }
    }
    
    func getQuantityCart()-> Int {
        var total = 0
        for i in cart {
            if i.isChecked {
                total += i.quantity
            }
        }
        return total
    }
    
    func getTotalPriceCart()-> Int {
        var total = 0
        for i in cart {
            if i.isChecked {
                total += (i.quantity * i.product.price)
            }
        }
        print("asu\(total)")
        return total
    }
    
    func appendCartToFirebase() {
        var ref: DocumentReference? = nil
        
//        ref = db.collection("Order").document(globalUserID).collection("Cart").addDocument(data: [
//            "userID" : globalUserID,
//            "orderData": Date(),
//            "paymentType": order.paymentType,
//            "status" : order.status,
//            "totalOrder" : order.totalOrder,
//            "totalPrice" : order.totalPrice
//        ]) { err in
//            if let err = err {
//                print("Error adding Cart: \(err)")
//            } else {
//                print("Cart added with ID: \(ref!.documentID)")
//            }
//        }
        
        for i in order.cart {
            ref = db.collection("Order").addDocument(data: [
                "userID" : globalUserID,
                "productID" : i.product.id,
                "quantity" : i.quantity,
                "orderDate": Date(),
                "paymentType": order.paymentType,
                "status" : order.status,
                "totalOrder" : order.totalOrder,
                "totalPrice" : order.totalPrice
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
        
//        for i in cart {
//            if i.isChecked {
//                ref = db.collection("Cart").addDocument(data: [
//                    "productId": i.product.id,
//                    "quantity": i.quantity,
//                    "userId" : globalUserID,
//                    "dateTime" : i.dateTime,
//                    "status" : i.status
//                ]) { err in
//                    if let err = err {
//                        print("Error adding Cart: \(err)")
//                    } else {
//                        print("Cart added with ID: \(ref!.documentID)")
//                    }
//                }
//                print("CEK123\(i.quantity) Ini stock \(i.product.stock)")
//
//                db.collection("Product").document(i.product.id).updateData([
//                    "stock": i.product.stock - i.quantity
//                ])
//            }
//        }
        
        cart.removeAll()
        order.removeOrderData()
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
