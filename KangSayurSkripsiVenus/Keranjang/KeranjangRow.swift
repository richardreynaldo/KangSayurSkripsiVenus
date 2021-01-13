//
//  KeranjangRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct KeranjangRow: View {
    var nama: String
    var harga: Int
    var gambar:String
    @State var jumlah : Int = 1
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            VStack{
                HStack {
                    CheckView()
                    
                    // ini harusnya ada if buat check barangnya apa terus keluarin gambarnya berdasarkan barang
                    
                    Image(gambar)
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text("\(nama)")
    //                        .font(StyleFont.captionSmall)
                            .fontWeight(.light)
    //                        .foregroundColor(StyleColors.accountPageCaptionSmall)
                            .padding(.top, 10)
                        
                        Text("Rp.\(harga)")
    //                        .font(StyleFont.heading2)
    //                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
                        
                        //kurang yang tempat sampah buat delete sama + - buat quantity
                    }
                    .padding(.leading, 14)
                    
                     Spacer()
                }
                .padding(.horizontal, 22)
                HStack
                {
                    Spacer()
                    
                    Button(action: {
                        print("asu")
                    }, label: {
                        Image("trash")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                    
                    
                    Stepper("\(jumlah)", value: $jumlah)
                        .frame(width: 120, height: 20)
                }
            }
            
        }
        .onChange(of: jumlah, perform: { value in
        let totalHarga = harga * value
            total += totalHarga
        })
    }
}

struct KeranjangRow_Previews: PreviewProvider {
    static var previews: some View {
        KeranjangRow(nama: "Kangkung", harga: 20000, gambar: "", jumlah: 0)
    }
}

struct CheckView: View {
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}
    var body: some View {
        Button(action: toggle){
            HStack{ Image(systemName: isChecked ? "checkmark.square": "square")
            }
        }
    }
}
