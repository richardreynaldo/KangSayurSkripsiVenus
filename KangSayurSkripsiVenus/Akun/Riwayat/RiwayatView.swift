//
//  RiwayatPembelianView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 22/01/21.
//

import SwiftUI

struct RiwayatView: View {
    private let calendar = Calendar.current
    private let year = Calendar.current.component(.year, from: Date())
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var historyData: HistoryData
    @EnvironmentObject var productData: ProductData
    
    init() {
        // List clear background color
        UITableView.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
        UITableViewCell.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(Array(stride(from: 2020, to: 2025, by: 1)).reversed(), id:\.self) { year in
                        ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                            if (!historyData.history.filter({calendar.component(.month, from: $0.orderDate) == month && calendar.component(.year, from: $0.orderDate) == year}).isEmpty) {
                                VStack {
                                    Text(String(calendar.monthSymbols[month-1]) + " " + String(year))
                                        .font(Font.custom("Sora-SemiBold", size: 15))
                                        .foregroundColor(StyleColors.titleText)
                                    
                                    ForEach(historyData.history.filter({calendar.component(.month, from: $0.orderDate) ==  month && calendar.component(.year, from: $0.orderDate) == year}), id:\.id) { history in
                                        NavigationLink(destination: RiwayatDetailView(history: history)) {
                                            RiwayatRow(history: history)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(StyleColors.secondaryYellow)
        .navigationBarTitle("Riwayat")
        .onAppear {
            if userData.profile?.isAdmin ?? false {
                DispatchQueue.main.async {
                    historyData.getAllHistoryData(productData: productData)
                    historyData.updateHistoryStatus()
                }
            } else {
                DispatchQueue.main.async {
                    historyData.getHistoryData(productData: productData)
                    historyData.updateHistoryStatus()
                }
            }
        }
    }
}

struct RiwayatView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatView()
    }
}
