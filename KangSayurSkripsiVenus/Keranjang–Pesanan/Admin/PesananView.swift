//
//  PesananView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 29/01/21.
//

import SwiftUI

struct PesananView: View {
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
            ScrollView {
                LazyVStack {
                    ForEach(Array(stride(from: 2020, to: 2025, by: 1)).reversed(), id:\.self) { year in
                        ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                            if (!historyData.history.filter({calendar.component(.month, from: $0.orderDate) ==  month && calendar.component(.year, from: $0.orderDate) ==  year}).isEmpty) {
                                VStack {
                                    Text(String(calendar.monthSymbols[month-1]) + " " + String(year))
                                        .font(Font.custom("Sora-SemiBold", size: 15))
                                        .foregroundColor(StyleColors.titleText)
                                    
                                    ForEach(historyData.history.filter({calendar.component(.month, from: $0.orderDate) ==  month && calendar.component(.year, from: $0.orderDate) ==  year}), id:\.id) { history in
                                        if history.status == "Preparing" || history.status == "Delivering" {
                                            NavigationLink(destination: PesananDetailView(history: history)) {
                                                PesananRow(history: history)
                                            }
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
        .onAppear {
            DispatchQueue.main.async {
                historyData.getPesananData(productData: productData)
            }
        }
    }
}

struct PesananView_Previews: PreviewProvider {
    static var previews: some View {
        PesananView()
    }
}
