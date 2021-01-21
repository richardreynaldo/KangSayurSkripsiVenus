//
//  ProductData.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 15/01/21.
//

import Foundation
import FirebaseFirestore

class ProductData: ObservableObject {
//    @Published var categories = [Category]()
    @Published var products = [Product]()
    
    private var db = Firestore.firestore()
    
    func getProductData() {
        db.collection("Product").addSnapshotListener { (querySnapshot, erron) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.products = documents.map({ queryDocumentSnapshot -> Product in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let price = data["price"] as? Int ?? 0
                let stock = data["stock"] as? Int ?? 0
                let desc = data["desc"] as? String ?? ""
                let category = data["category"] as? String ?? ""
                
                return Product(id: queryDocumentSnapshot.documentID, image: name, name: name, price: price, stock: stock, desc: desc, category: category)
            })
        }
    }
    
    // Temporary Function
    func appendToFirebase() {
        var ref: DocumentReference? = nil
        
        for item in products {
            ref = db.collection("Product").addDocument(data: [
                "name" : item.name,
                "price" : item.price,
                "stock" : item.stock,
                "desc" : item.desc,
                "category" : item.category
            ]) { error in
                if let error = error {
                    print("Error adding product to Firebase: \(error)")
                } else {
                    print("Product added with ID: \(ref!.documentID)")
                }
            }
        }
    }
}
