//
//  ProductData.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 15/01/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class ProductData: ObservableObject {
    @ObservedObject var loader = Loader()
    @Published var products = [Product]()
    
    private var db = Firestore.firestore()
    
    func getProductData() {
        // Get product data once – Code runs manually
        db.collection("Product").getDocuments { (querySnapshot, error) in
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
        
        
        // Get product data everytime a change or changes happens – Code runs automatically
        /* db.collection("Product").addSnapshotListener { (querySnapshot, error) in
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
        } */
    }
    
    func getProductStock()-> Int {
        var total = 0
        for i in products {
            total += i.stock
        }
        return total
    }
    
    func deleteProductData(productId : String){
        db.collection("Product").document(productId).delete() { err in
            if let err = err {
                print("Error removing product: \(err)")
            } else {
                print("Product successfully removed!")
            }
        }
    }
    
    func updateProductStock() {
        loader.showLoader()
        
        for i in products {
            db.collection("Product").document(i.id).updateData([
                "stock" : i.stock
            ]) { error in
                if let error = error {
                    print("Error updating product stock: \(error)")
                    self.loader.removeLoader()
                } else {
                    print("Product stock successfully updated!")
                    self.loader.removeLoader()
                }
            }
        }
    }
    
    func updateProductData(product: Product, name: String, price: Int, stock: Int) {
        loader.showLoader()
        
        db.collection("Product").document(product.id).updateData([
            "name" : name,
            "price" : price,
            "stock" : stock
        ]) { error in
            if let error = error {
                print("Error updating product data: \(error)")
                self.loader.removeLoader()
            } else {
                print("Product data successfully updated!")
                self.loader.removeLoader()
            }
        }
    }
    
    
    // Temporary Function
    /* func appendToFirebase() {
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
    } */
}
