//
//  RiwayatPembelianView.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 22/01/21.
//

import SwiftUI

struct RiwayatPembelianView: View {
    private let calendar = Calendar.current
    private let year = Calendar.current.component(.year, from: Date())
    @EnvironmentObject var historyData:HistoryData
    @EnvironmentObject var productData: ProductData
    var body: some View {
        GeometryReader{
            geometry in
            ZStack{
                List{
                    ForEach(Array(stride(from: 1, to: 13, by: 1)), id:\.self) { month in
                        Section(header: Text(String(calendar.monthSymbols[month-1]) + " " + String(year))) {
                            ForEach(historyData.history.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2021}), id:\.id) {
                                history in
                                RiwayatPembelianRow(image: history.product.image, date: history.dateTime, name: history.product.name, status: history.status)
                            }
                        }
                    }
                }
            }
            .onAppear{
                historyData.getHistoryData(productData: productData)
            }
        }
    }
}

struct RiwayatPembelianView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatPembelianView()
    }
}
