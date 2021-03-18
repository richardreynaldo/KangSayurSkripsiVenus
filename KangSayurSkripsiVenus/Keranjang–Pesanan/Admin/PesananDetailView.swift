//
//  PesananDetail.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 29/01/21.
//

import SwiftUI

struct PesananDetailView: View {
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
                    /* Image(history.product.name)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit) */
                    
                    VStack(alignment: .leading) {
                        Text("Informasi Produk")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Nama") //nama produk
                                    Text("Kuantitas") //berat produk
                                    Text("Harga") //harga produk
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text(history.orders[0].product.name) //nama produk
                                    Text("\(history.orders[0].quantity) kg") //berat produk
                                    Text("Rp\(history.orders[0].product.price)/kg") //harga produk
                                }
                            }
                            
                            Divider()
                        }
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Text("Detail Order")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("ID") //id order
                                    Text("Tanggal") //tanggal order
                                    Text("Waktu") //waktu order
                                    Text("Status") //status order
                                    Text("Total") //total order
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text(history.id) //id order
                                    Text("\(history.orderDate, formatter: Self.dateFormat)") //tanggal order
                                    Text("\(history.orderDate, formatter: Self.timeFormat)") //waktu order
                                    Text(history.status) //status order
                                    Text("Rp\(history.totalPrice)") //total order
                                }
                            }
                            
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
        .navigationBarTitle("Pesanan")
    }
}

struct PesananDetail_Previews: PreviewProvider {
    static var previews: some View {
        PesananDetailView(history: History.example)
    }
}
