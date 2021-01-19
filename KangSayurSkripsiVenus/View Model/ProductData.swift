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
        products.append(Product(id: "001", image: "brokoli", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli", category: "Sayur"))
        products.append(Product(id: "002", image: "kailan", name: "Kailan", price: 20000, stock: 20, desc: "Sayur Kailan", category: "Sayur"))
        products.append(Product(id: "003", image: "bayam hijau", name: "Bayam", price: 15000, stock: 15, desc: "Sayur Bayam", category: "Sayur"))
        products.append(Product(id: "004", image: "tauge", name: "Tauge", price: 25000, stock: 25, desc: "Sayur Tauge", category: "Sayur"))
//        db.collection("Product").document("")
    }
}