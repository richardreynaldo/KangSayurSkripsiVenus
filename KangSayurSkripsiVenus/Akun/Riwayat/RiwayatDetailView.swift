//
//  RiwayatDetailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct RiwayatDetailView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var historyData: HistoryData
    @State private var isShowingAlert: Bool = false
    
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
    
    /* init(history: History) {
        //Disable selection.
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        
        self.history = history
    } */
    
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
                            ForEach(history.orders.filter({
                                $0.orderID == history.id
                            })) { item in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Nama") //nama produk
                                        Text("Kuantitas") //berat produk
                                        Text("Harga") //harga produk
                                    }
                                    .font(Font.custom("Sora-Light", size: 16))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text(item.product.name) //nama produk
                                        Text("\(item.quantity) kg") //berat produk
                                        Text("Rp\(item.product.price)/kg") //harga produk
                                    }
                                    .font(Font.custom("Sora-Regular", size: 16))
                                }
                                
                                Divider()
                            }
                        }
                        /* .font(Font.custom("Sora-Regular", size: 16)) */
                        .foregroundColor(StyleColors.secondaryTitleText)
                        
                        Text("Detail Order")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                            .padding(.bottom, 4)
                        
                        Group {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Tanggal") //tanggal order
                                    Text("Waktu") //waktu order
                                    Text("Status") //status order
                                    Text("Ongkos Kirim") //ongkos kirim
                                    Text("Total") //total order
                                }
                                .font(Font.custom("Sora-Light", size: 16))
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text("\(history.orderDate, formatter: Self.dateFormat)") //tanggal order
                                    Text("\(history.orderDate, formatter: Self.timeFormat)") //waktu order
                                    Text(history.status) //status order
                                    Text("Rp10,000") //ongkos kirim
                                    Text("Rp\(history.totalPrice)") //total order
                                }
                                .font(Font.custom("Sora-Regular", size: 16))
                            }
                            
                            Divider()
                        }
                        /* .font(Font.custom("Sora-Regular", size: 16)) */
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
                    
                    switch history.status {
                    case "Cancelled":
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(StyleColors.disabledButtonBg)
                                    .frame(height: 52)
                                
                                Text("Pesanan Dibatalkan")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .disabled(true)
                        .padding(.vertical, 8)
                        
                    case "Waiting":
                        Button(action: {
                            isShowingAlert = true
                        }, label: {
                            ZStack {
                                Capsule()
                                    .stroke(StyleColors.primaryRed)
                                    .frame(height: 52)
                                
                                Text("Batalkan Pesanan")
                                    .foregroundColor(StyleColors.primaryRed)
                            }
                        })
                        .padding(.vertical, 8)
                        .alert(isPresented: $isShowingAlert) {
                            Alert(title: Text("Batalkan Pesanan?"), message: Text("Apakah anda yakin ingin membatalkan pesanan?"), primaryButton: .destructive(Text("Ya")) {
                                DispatchQueue.main.async {
                                    historyData.cancelOrder(history: history)
                                }
                            }, secondaryButton: .cancel(Text("Tidak")))}
                        
                    case "Preparing":
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(StyleColors.disabledButtonBg)
                                    .frame(height: 52)
                                
                                Text("Pesanan Sedang Disiapkan")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .disabled(true)
                        .padding(.vertical, 8)
                        
                    case "Delivering":
                        Button(action: {
                            isShowingAlert = true
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(StyleColors.primaryRed)
                                    .frame(height: 52)
                                
                                Text("Konfirmasi Pesanan Diterima")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .padding(.vertical, 8)
                        .alert(isPresented: $isShowingAlert) {
                            Alert(title: Text("Pesanan Diterima?"), message: Text("Apakah pesanan sudah diterima dengan baik dan benar?"), primaryButton: .default(Text("Ya")) {
                                DispatchQueue.main.async {
                                    historyData.receiveOrder(history: history)
                                }
                            }, secondaryButton: .cancel(Text("Tidak")))}
                        
                    case "Received":
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(StyleColors.disabledButtonBg)
                                    .frame(height: 52)
                                
                                Text("Pesanan Telah Diterima")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .disabled(true)
                        .padding(.vertical, 8)
                        
                    default:
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Capsule()
                                    .fill(StyleColors.disabledButtonBg)
                                    .frame(height: 52)
                                
                                Text("Pesanan Telah Diterima")
                                    .foregroundColor(Color.white)
                            }
                        })
                        .disabled(true)
                        .padding(.vertical, 8)
                    }
                }
                .padding()
            }
        }
        .background(StyleColors.secondaryYellow)
        .navigationBarTitle("Riwayat")
    }
}


struct RiwayatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatDetailView(history: History.example)
    }
}
