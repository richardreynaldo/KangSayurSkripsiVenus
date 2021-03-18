//
//  HistoryData.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 23/01/21.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class HistoryData: ObservableObject {
    @ObservedObject var loader = Loader()
    
    @Published var history = [History]()
    @Published var orders = [Orders]()
    private var db = Firestore.firestore()

    func getHistoryData(productData: ProductData) {
        // Current Working Code
        db.collection("Order").whereField("userID", isEqualTo: globalUserID).order(by: "status").order(by: "orderDate", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.history = documents.map({ queryDocumentSnapshot -> History in
                let data = queryDocumentSnapshot.data()
                let paymentType = data["paymentType"] as? String ?? "Cash on Delivery"
                let status = data["status"] as? String ?? ""
                let totalOrder = data["totalOrder"] as? Int ?? 0
                let totalPrice = data["totalPrice"] as? Int ?? 0
                let timeStamp = data["orderDate"] as? Timestamp ?? Timestamp()
                let orderDate = timeStamp.dateValue()
                
                self.db.collection("Order").document(queryDocumentSnapshot.documentID).collection("Orders").getDocuments { (snapshot, err) in
                    guard let documents = snapshot?.documents else {
                        print("No documents")
                        return
                    }
                    
                    self.orders = documents.map({ documentSnapshot -> Orders in
                        let data = documentSnapshot.data()
                        let productID = data["productID"] as? String ?? ""
                        let quantity = data["quantity"] as? Int ?? 0
                        
                        return Orders(id: documentSnapshot.documentID, orderID: queryDocumentSnapshot.documentID, product: productData.products.first(where: {$0.id == productID}) ?? Product.example, quantity: quantity)
                    })
                }
                
                print("documents: \(queryDocumentSnapshot)")
                print("totalOrder: \(totalOrder)")
                print("orders: \(self.orders)")
                
                return History(id: queryDocumentSnapshot.documentID, orderDate: orderDate, paymentType: paymentType, status: status, totalOrder: totalOrder, totalPrice: totalPrice, orders: self.orders)
            })
        }
        
        
        // Alternate Code 2
        /* for i in documents {
            let data = i.data()
            let paymentType = data["paymentType"] as? String ?? "Cash on Delivery"
            let status = data["status"] as? Int ?? 0
            let totalOrder = data["totalOrder"] as? Int ?? 0
            let totalPrice = data["totalPrice"] as? Int ?? 0
            let timeStamp = data["orderDate"] as? Timestamp ?? Timestamp()
            let orderDate = timeStamp.dateValue()
            
            self.db.collection("Order").document(i.documentID).collection("Orders").whereField("orderID", isEqualTo: i.documentID).getDocuments { (snapshot, err) in
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }
                for j in documents {
                    let data = j.data()
                    let orderID = data["orderID"] as? String ?? ""
                    let productID = data["productID"] as? String ?? ""
                    let quantity = data["quantity"] as? Int ?? 0
                    
                    self.history.append(History(id: i.documentID, orderDate: orderDate, paymentType: paymentType, status: status, totalOrder: totalOrder, totalPrice: totalPrice, orders: [Orders(id: j.documentID, orderID: orderID, product: productData.products.first(where: {$0.id == productID}) ?? Product.example, quantity: quantity)]))
                }
            }
        } */
    }
    
    /* func getHistoryDetail(index: Int, productData: ProductData) {
        db.collection("Order").whereField("userID", isEqualTo: globalUserID).order(by: "status").order(by: "orderDate", descending: true).addSnapshotListener { (snapshot, err) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            
            self.history = documents.map({
                self.db.collection("Order").document($0.documentID).collection("Orders").whereField("orderID", isEqualTo: $0.documentID).getDocuments { (snapshot, err) in
                    
                    guard let documents = snapshot?.documents else {
                        print("No documents")
                        return
                    }
                    
                    self.history[index].orders = documents.map({
                        let data = $0.data()
                        let productID = data["productID"] as? String ?? ""
                        let quantity = data["quantity"] as? Int ?? 0
                    })
                    
                    
                }
            })
        }
    } */
    
    func confirmOrder(history: History) {
        db.collection("Order").document(history.id).updateData(["status" : true]) { error in
            if let error = error {
                print("Error updating product status: \(error)")
            } else {
                print("Product status successfully updated!")
            }
        }
    }
    
    // Alternate Function
    /* func alternateGetHistoryData(productData: ProductData) {
        // Listen to document metadata.
        db.collection("Order").document(globalUserID).collection("Orders").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.history = documents.map({ queryDocumentSnapshot -> History in
                let data = queryDocumentSnapshot.data()
                let quantity = data["quantity"] as? Int ?? 0
                let productID = data["productID"] as? String ?? ""
                let status = data["status"] as? Bool ?? false
                let timeStamp = data["orderDate"] as? Timestamp ?? Timestamp()
                let dateTime = timeStamp.dateValue()
                
                
                return History(id: queryDocumentSnapshot.documentID, product: productData.products.first(where: {$0.id == productID}) ?? Product.example, quantity: quantity, dateTime: dateTime, status: status)
            })
        }
    } */
    
}
