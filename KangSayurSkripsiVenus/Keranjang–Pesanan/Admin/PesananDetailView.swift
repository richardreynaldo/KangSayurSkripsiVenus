//
//  PesananDetail.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 29/01/21.
//

import SwiftUI

struct PesananDetailView: View {
    @EnvironmentObject var historyData: HistoryData
    @State private var isActionSheetShow = false
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
                                    Text("Total") //total order
                                }
                                .font(Font.custom("Sora-Light", size: 16))
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text("\(history.orderDate, formatter: Self.dateFormat)") //tanggal order
                                    Text("\(history.orderDate, formatter: Self.timeFormat)") //waktu order
                                    Text(history.status) //status order
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
                            Text("\(historyData.profilePemesan!.address[0]), \(historyData.profilePemesan!.address[1]) \(historyData.profilePemesan!.address[2]), RT \(historyData.profilePemesan!.address[3]) RW \(historyData.profilePemesan!.address[4]), Kelurahan \(historyData.profilePemesan!.address[5]), Kecamatan \(historyData.profilePemesan!.address[6]), Kota \(historyData.profilePemesan!.address[7]), \(historyData.profilePemesan!.address[8]), \(historyData.profilePemesan!.address[9])")
                            
                            Divider()
                        }
                        .font(Font.custom("Sora-Regular", size: 16))
                        .foregroundColor(StyleColors.secondaryTitleText)
                    }
                    
                    HStack {
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
                                    
                                    Text("Tolak")
                                        .foregroundColor(StyleColors.primaryRed)
                                }
                            })
                            .padding(.vertical, 8)
                            .alert(isPresented: $isShowingAlert) {
                                Alert(title: Text("Tolak Pesanan"), message: Text("Apakah anda yakin ingin menolak pesanan?"), primaryButton: .destructive(Text("Ya")) {
                                    DispatchQueue.main.async {
                                        historyData.cancelOrder(history: history)
                                    }
                                }, secondaryButton: .cancel(Text("Tidak")))}
                            
                            Button(action: {
                                DispatchQueue.main.async {
                                    historyData.confirmOrder(history: history)
                                }
                            }, label: {
                                ZStack {
                                    Capsule()
                                        .fill(StyleColors.primaryRed)
                                        .frame(height: 52)
                                    
                                    Text("Terima")
                                        .foregroundColor(Color.white)
                                }
                            })
                            .padding(.vertical, 8)
                            
                        case "Preparing":
                            Button(action: {
                                DispatchQueue.main.async {
                                    historyData.deliverOrder(history: history)
                                }
                            }, label: {
                                ZStack {
                                    Capsule()
                                        .fill(StyleColors.primaryRed)
                                        .frame(height: 52)
                                    
                                    Text("Kirim Pesanan")
                                        .foregroundColor(Color.white)
                                }
                            })
                            .padding(.vertical, 8)
                            
                        case "Delivering":
                            Button(action: {
                                
                            }, label: {
                                ZStack {
                                    Capsule()
                                        .fill(StyleColors.disabledButtonBg)
                                        .frame(height: 52)
                                    
                                    Text("Pesanan Sedang Dikirim")
                                        .foregroundColor(Color.white)
                                }
                            })
                            .disabled(true)
                            .padding(.vertical, 8)
                            
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
