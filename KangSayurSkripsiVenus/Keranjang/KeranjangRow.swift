//
//  KeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangRow: View {
    @EnvironmentObject var cartData: CartData
    @EnvironmentObject var productData: ProductData
    @State var disabled1 = false
    @Binding var isAllChecked: Bool
    var product: Product
    var cart: Cart
    var index: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            VStack {
                HStack {
                    CheckView(isAllChecked: $isAllChecked, index: index)
                    
                    // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(Font.custom("Sora-Bold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.top, 10)
                        
                        Text("Rp\(product.price)/kg")
                            .font(Font.custom("Sora-Regular", size: 16))
                            .foregroundColor(StyleColors.titleText)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        cartData.delete(index: index)
                    }, label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                    
                    
                    Button(action: {
                        cartData.remove(index: index, product: product)
                        disabled1 = false
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .disabled(!cart.isChecked)
                    
                    VStack{
                        Text("\(cart.quantity)")
                            .font(Font.custom("Sora-Regular", size: 12))
                            .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Rectangle()
                            .frame(width: 35, height: 1, alignment: .center)
                    }
                    
                    Button(action: {
                        if cart.quantity == product.stock {
                            disabled1 = true
                        } else {
                            cartData.add(index: index, product: product)
                        }
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .disabled(disabled1)
                    .disabled(!cart.isChecked)
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

struct CheckAllView: View {
    @EnvironmentObject var cartData: CartData
    @Binding var isAllChecked: Bool
    
    func toggle() {
        isAllChecked = !isAllChecked
        
        cartData.cart.updateEach { item in
            item.isChecked = isAllChecked
            cartData.order.totalOrder = cartData.getTotalPriceCart()
            isCheckedChecker = isAllChecked
        }
    }
    
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isAllChecked ? "checkmark.square": "square")
            }
        }
        .onChange(of: isCheckedChecker) { value in
            if cartData.cart.allSatisfy(\.isChecked) {
                isAllChecked = true
                isCheckedChecker = true
            } else {
                isAllChecked = false
            }
        }
    }
}

struct CheckView: View {
    @EnvironmentObject var cartData: CartData
    @Binding var isAllChecked: Bool
    @State var isChecked: Bool = false
    var index: Int
    
    func toggle() {
        isChecked = !isChecked
        cartData.cart[index].isChecked = isChecked
        cartData.order.totalOrder = cartData.getTotalPriceCart()
        
        if cartData.cart.allSatisfy(\.isChecked) {
            isAllChecked = true
            isCheckedChecker = true
        } else {
            isAllChecked = false
        }
    }
    
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
        .onChange(of: isCheckedChecker, perform: { value in
            isChecked = isCheckedChecker
            cartData.cart[index].isChecked = isCheckedChecker
            cartData.order.totalOrder = cartData.getTotalPriceCart()
        })
    }
}
