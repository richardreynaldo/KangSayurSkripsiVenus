//
//  HomeView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct HomeView: View {
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var text = ""
    
    var body: some View {
        VStack{
            SearchBar(text: $text)
            
            ScrollView(.vertical , showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(product.filter({"\($0)".contains(text) || text.isEmpty})){ i in
//                        Text(i.nama)
//                            .padding(.all, 30)
//                            .background(Color.gray)
                        CollectionViewCell()
                    }
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

struct Product: Identifiable {
    var id = UUID()
    var nama: String
//    var status: String
//    var harga: String
}

var product = [
    Product(nama: "Kangkung"),
    Product(nama: "Bayam Hijau"),
    Product(nama: "Bayam Merah"),
    Product(nama: "Tauge"),
    Product(nama: "Kailan"),
    Product(nama: "Seledri")
]