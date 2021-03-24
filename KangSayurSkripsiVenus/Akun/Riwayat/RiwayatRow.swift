//
//  RiwayatPembelianRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 22/01/21.
//

import SwiftUI

struct RiwayatRow: View {
    @EnvironmentObject var historyData: HistoryData
    @State var recent: [Orders] = []
    var history: History
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "d MMMM yyyy, h:mm a"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                /* Image(history.product.name)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit) */
                
                VStack(alignment: .leading) {
                    Text("\(history.orderDate, formatter: Self.dateFormat)")
                        .font(Font.custom("Sora-Light", size: 10))
                        .foregroundColor(StyleColors.captionSmall)
                        .padding(.top, 10)
                    
                    if recent.count > 1 {
                        Text("\(recent[0].product.name), \(recent[1].product.name), and \(recent.count - 2) others")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(StyleColors.titleText)
                    } else if recent.count == 1 {
                        Text("\(recent[0].product.name)")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(StyleColors.titleText)
                    } else {
                        Text("N/A")
                            .font(Font.custom("Sora-Bold", size: 15))
                            .foregroundColor(StyleColors.titleText)
                    }
                    
                    Text("Status: \(history.status)")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(history.status == "Cancelled" ? StyleColors.primaryRed : StyleColors.titleText)
                        .padding(.bottom, 10)
                }
                .padding(.leading, 10)
                
                 Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            recent = historyData.orders.filter({ item -> Bool in
                item.orderID == history.id
            })
        }
    }
}

struct RiwayatRow_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatRow(history: History.example)
    }
}
