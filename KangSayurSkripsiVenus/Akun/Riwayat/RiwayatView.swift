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
    @EnvironmentObject var historyData: HistoryData
    @EnvironmentObject var productData: ProductData
    
    init() {
        // List clear background color
        UITableView.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
        UITableViewCell.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(Array(stride(from: 2020, to: 2025, by: 1)).reversed(), id:\.self) { year in
                    ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                        if (!historyData.history.filter({calendar.component(.month, from: $0.orderDate) == month && calendar.component(.year, from: $0.orderDate) ==  year}).isEmpty) {
                            Section(header: Text(String(calendar.monthSymbols[month-1]) + " " + String(year))) {
                                ForEach(historyData.history.filter({calendar.component(.month, from: $0.orderDate) ==  month && calendar.component(.year, from: $0.orderDate) ==  year}), id:\.id) { history in
                                    ZStack {
                                        RiwayatRow(history: history)
                                        
                                        NavigationLink(destination: RiwayatDetailView(history: history)) {
                                            EmptyView()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .listRowBackground(StyleColors.secondaryYellow)
            }
            .listStyle(SidebarListStyle())
        }
        .background(StyleColors.secondaryYellow)
        .navigationBarTitle("Riwayat")
        .onAppear {
            DispatchQueue.main.async {
                historyData.getHistoryData(productData: productData)
            }
        }
    }
}

struct RiwayatView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatView()
    }
}
