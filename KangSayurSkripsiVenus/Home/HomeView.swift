//
//  HomeView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct HomeView: View {
    var product: [Product] = [Product(id: "001", name: "Brokoli", price: 10000, stock: 10, desc: "Sayur Brokoli", category: "Sayuran"),
                              Product(id: "002", name: "Pisang", price: 5000, stock: 20, desc: "Buah Pisang", category: "Buah")]
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var text = ""
    
    var body: some View {
        VStack{
            SearchBar(text: $text)
            
            ScrollView(.vertical , showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(product, id:\.id) { i in
                        CollectionViewCell()
                    }
//                    ForEach(product.filter({"\($0)".contains(text) || text.isEmpty})){ i in
////                        Text(i.nama)
////                            .padding(.all, 30)
////                            .background(Color.gray)
//                        CollectionViewCell()
//                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//struct Product: Identifiable {
//    var id = UUID()
//    var nama: String
////    var status: String
////    var harga: String
//}
//
//var product = [
//    Product(productID: UUID(), name: "Kangkung", price: "10000", stock: "5", desc: ""),
//]
