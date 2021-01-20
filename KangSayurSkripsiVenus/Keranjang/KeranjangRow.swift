//
//  KeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangRow: View {
    @EnvironmentObject var cartData: CartData
    var index: Int
    var product:Product
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            VStack {
                HStack {
                    CheckView()
                    
                    // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            //                        .font(StyleFont.captionSmall)
                            .fontWeight(.light)
                            //                        .foregroundColor(StyleColors.accountPageCaptionSmall)
                            .padding(.top, 10)
                        
                        Text("Rp\(product.price)/kg")
                        //                        .font(StyleFont.heading2)
                        //                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
                        
                        //kurang yang tempat sampah buat delete sama + - buat quantity
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("asu")
                    }, label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                    
                    
                    Button(action: {
                        cartData.remove(index: index, product: product)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    
                    VStack{
                        Text("\(cartData.cart[index].quantity)")
                        Rectangle()
                            .frame(width: 35, height: 1, alignment: .center)
                    }
                    
                    Button(action: {
                        cartData.add(index: index, product: product)
                        print("lonte \(product.stock)")
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                }
            }
            .padding()
            
        }
//        .onChange(of: jumlah, perform: { value in
//            let totalHarga = harga * value
//            total += totalHarga
//        })
    }
}

//struct KeranjangRow_Previews: PreviewProvider {
//    static var previews: some View {
//        KeranjangRow(nama: "Kangkung", harga: 20000, gambar: "", jumlah: 0)
//    }
//}

struct CheckView: View {
    @State var isChecked: Bool = false
    
    func toggle() {
        isChecked = !isChecked
    }
    
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}
