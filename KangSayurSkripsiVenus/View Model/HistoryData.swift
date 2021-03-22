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
    @Published var profilePemesan: ProfilePemesan?
    private var db = Firestore.firestore()

    
//    func getOrdersData() -> Orders {
//
//    }
    
    func getHistoryData(productData: ProductData) {
        // Current Working Code
        db.collection("Order").whereField("userID", isEqualTo: globalUserID).order(by: "orderDate", descending: true).addSnapshotListener { (querySnapshot, error) in
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
                let userID = data["userID"] as? String ?? ""
                let timeStamp = data["orderDate"] as? Timestamp ?? Timestamp()
                let orderDate = timeStamp.dateValue()
                
                self.db.collection("Orders").order(by: "quantity").addSnapshotListener { (snapshot, err) in
                    guard let documents = snapshot?.documents else {
                        print("No documents")
                        return
                    }
                    self.orders = documents.map({ documentSnapshot -> Orders in
                        let data = documentSnapshot.data()
                        let productID = data["productID"] as? String ?? ""
                        let quantity = data["quantity"] as? Int ?? 0
                        let orderID = data["orderID"] as? String ?? ""
                        return Orders(id: documentSnapshot.documentID, orderID: orderID, product: productData.products.first(where: {$0.id == productID}) ?? Product.example, quantity: quantity)
                    })
                }
                
                print("documents: \(queryDocumentSnapshot)")
                print("totalOrder: \(totalOrder)")
                print("orders: \(self.orders)")
                
                return History(id: queryDocumentSnapshot.documentID, orderDate: orderDate, paymentType: paymentType, status: status, totalOrder: totalOrder, totalPrice: totalPrice, userID: userID, orders: self.orders)
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
    
    
    func getPesananData(productData: ProductData) {
        db.collection("Order").order(by: "orderDate", descending: true).addSnapshotListener { (querySnapshot, error) in
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
                let userID = data["userID"] as? String ?? ""
                let timeStamp = data["orderDate"] as? Timestamp ?? Timestamp()
                let orderDate = timeStamp.dateValue()
                
                self.db.collection("Orders").order(by: "quantity").addSnapshotListener { (snapshot, err) in
                    guard let documents = snapshot?.documents else {
                        print("No documents")
                        return
                    }
                    self.orders = documents.map({ documentSnapshot -> Orders in
                        let data = documentSnapshot.data()
                        let productID = data["productID"] as? String ?? ""
                        let quantity = data["quantity"] as? Int ?? 0
                        let orderID = data["orderID"] as? String ?? ""
                        return Orders(id: documentSnapshot.documentID, orderID: orderID, product: productData.products.first(where: {$0.id == productID}) ?? Product.example, quantity: quantity)
                    })
                }
                
                self.db.collection("User").document(userID).getDocument { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        
                        let firstName = data?["firstName"] as? String ?? ""
                        let lastName = data?["lastName"] as? String ?? ""
                        let email = data?["email"] as? String ?? ""
                        let timestamp = data?["dob"] as? Timestamp
                        let address = data?["address"] as? [String] ?? []
                        let isAdmin = data?["isAdmin"] as? Bool ?? false
                        
                        let dob = timestamp?.dateValue() ?? Date()
                        
                        self.profilePemesan = ProfilePemesan(userID: globalUserID, firstName: firstName, lastName: lastName, email: email, dob: dob, address: address, isAdmin: isAdmin)
                        
                        print("This is your profile: \(self.profilePemesan ?? ProfilePemesan.default)")
                        print("This is your userID: \(userID)")
                    } else {
                        print("Document does not exist")
                    }
                }
                
                print("documents: \(queryDocumentSnapshot)")
                print("totalOrder: \(totalOrder)")
                print("orders: \(self.orders)")
                
                return History(id: queryDocumentSnapshot.documentID, orderDate: orderDate, paymentType: paymentType, status: status, totalOrder: totalOrder, totalPrice: totalPrice, userID: userID, orders: self.orders)
            })
        }
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
        db.collection("Order").document(history.id).updateData(["status" : "Preparing"]) { error in
            if let error = error {
                print("Error updating product status: \(error)")
            } else {
                print("Product status successfully updated!")
            }
        }
    }
    
    func cancelOrder(history: History) {
        db.collection("Order").document(history.id).updateData(["status" : "Cancelled"]) { error in
            if let error = error {
                print("Error updating product status: \(error)")
            } else {
                print("Product status successfully updated!")
            }
        }
    }
    
    func deliverOrder(history: History) {
        db.collection("Order").document(history.id).updateData(["status" : "Delivering"]) { error in
            if let error = error {
                print("Error updating product status: \(error)")
            } else {
                print("Product status successfully updated!")
            }
        }
    }
    
    func receiveOrder(history: History) {
        db.collection("Order").document(history.id).updateData(["status" : "Received"]) { error in
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
