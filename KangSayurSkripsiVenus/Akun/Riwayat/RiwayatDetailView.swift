//
//  RiwayatDetailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct RiwayatDetailView: View {
    @EnvironmentObject var userData: UserData
    @State private var isActionSheetShow = false
    @State private var showAlert = false
    
    var history: History
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "d MMMM yyyy"
        return formatter
    }()
    
    static let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    
    init(history: History) {
        //Disable selection.
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        
        self.history = history
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack (alignment: .center) {
                    //INI DI TENGAH TARO GAMBAR PRODUK AJA
                    Image(history.product.name)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text("Informasi Produk")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            Text("Nama: \(history.product.name)") //nama produk
                            Text("Kuantitas: \(history.quantity) kg") //berat produk
                            Text("Harga: Rp\(history.product.price)/kg") //harga produk
                            
                            Divider()
                        }
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Text("Detail Order")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            Text("ID: \(history.id)") //id order
                            Text("Tanggal: \(history.dateTime, formatter: Self.dateFormat)") //tanggal order
                            Text("Waktu: \(history.dateTime, formatter: Self.timeFormat)") //waktu order
                            Text("Status: \(history.status ? "Delivered" : "Preparing")") //status order
                            Text("Total: Rp\(history.product.price * history.quantity)") //total order
                            
                            Divider()
                        }
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Text("Alamat")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            Text("\(userData.profile!.address[0]), \(userData.profile!.address[1]) \(userData.profile!.address[2]), RT \(userData.profile!.address[3]) RW \(userData.profile!.address[4]), Kelurahan \(userData.profile!.address[5]), Kecamatan \(userData.profile!.address[6]), Kota \(userData.profile!.address[7]), \(userData.profile!.address[8]), \(userData.profile!.address[9])")
                            
                            Divider()
                        }
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                    }
                }
                .padding()
            }
        }
        .background(StyleColors.secondaryYellow)
        .navigationBarTitle("Riwayat")
    }
}


//struct RiwayatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RiwayatDetailView()
//    }
//}
