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
    
    // Temporary Function
    func getProductData() {
        products.append(Product(id: "001", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli", category: "Sayur"))
        products.append(Product(id: "002", name: "Pisang", price: 20000, stock: 20, desc: "Buah Pisang", category: "Buah"))
        products.append(Product(id: "003", name: "Bayem", price: 15000, stock: 15, desc: "Sayur Bayem", category: "Sayur"))
        products.append(Product(id: "004", name: "Apel", price: 25000, stock: 25, desc: "Buah Apel", category: "Buah"))
//        db.collection("Product").document("")
    }
}
