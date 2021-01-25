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
    @Published var history = [History]()
    @Published var order: Order?
    private var db = Firestore.firestore()

    func getHistoryData(productData: ProductData) {
        db.collection("Cart").whereField("userId", isEqualTo: globalUserID).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.history = documents.map({ queryDocumentSnapshot -> History in
                let data = queryDocumentSnapshot.data()
                let quantity = data["quantity"] as? Int ?? 0
                let productId = data["productId"] as? String ?? ""
                let status = data["status"] as? Bool ?? false
                let timeStamp = data["dateTime"] as? Timestamp ?? Timestamp()
                let dateTime = timeStamp.dateValue()
                
                
                return History(id: queryDocumentSnapshot.documentID, product: productData.products.first(where: {$0.id == productId})!, quantity: quantity, dateTime: dateTime, status: status)
            })
        }
    }
    
}
