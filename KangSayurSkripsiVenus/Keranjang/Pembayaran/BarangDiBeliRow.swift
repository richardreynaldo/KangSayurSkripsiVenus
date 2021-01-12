//
//  BarangDiBeliView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct BarangDiBeliRow: View {
    var quantity: Int
    var price: Int
    var quantityxprice: Int
    var nama: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 106)
            VStack(alignment: .leading){
                Text("Barang yang di beli")
                    .font(.title3)
                    .padding(.bottom, 5)
                    .padding([.leading, .trailing], 5)
                
                HStack{
                    //vstack yang ini harusnya di loop sesuai belanjaannya apa aja
                    VStack(alignment: .leading){
                        Text("\(nama)")
                        Text("\(quantity) x \(price)")
                    }
                    Spacer()
                    Text("Rp.\(quantityxprice)")
                    
                }.padding([.leading, .trailing], 5)
            }
        }
        
    }
}
struct BarangDiBeliView_Previews: PreviewProvider {
    static var previews: some View {
        BarangDiBeliRow(quantity: 1, price: 20000, quantityxprice: 20000, nama: "Brokoli")
    }
}
