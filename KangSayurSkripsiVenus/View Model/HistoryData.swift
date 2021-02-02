//
//  HistoryData.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 23/01/21.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class HistoryData: ObservableObject {
    @ObservedObject var loader = Loader()
    
    @Published var history = [History]()
    @Published var order: Order?
    private var db = Firestore.firestore()

    func getHistoryData(productData: ProductData) {
        db.collection("Order").whereField("userID", isEqualTo: globalUserID).order(by: "status").order(by: "orderDate", descending: true).addSnapshotListener { (querySnapshot, error) in
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
    }
    
    func confirmOrder(history: History) {
        loader.showLoader()
        
        db.collection("Order").document(history.id).updateData(["status" : true]) { error in
            if let error = error {
                print("Error updating product status: \(error)")
                self.loader.removeLoader()
            } else {
                print("Product status successfully updated!")
                self.loader.removeLoader()
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
