//
//  PesananView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 29/01/21.
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
        /* ZStack {
            List {
                ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                    if (!historyData.history.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2021}).isEmpty) {
                        Section(header: Text(String(calendar.monthSymbols[month-1]) + " " + String(year))) {
                            ForEach(historyData.history.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2021}), id:\.id) { history in
                                ZStack {
                                    PesananRow(history: history)
                                    
                                    NavigationLink(destination: PesananDetailView(history: history)) {
                                        EmptyView()
                                    }
                                }
                            }
                        }
                    }
                }
                .listRowBackground(StyleColors.secondaryYellow)
            }
            .listStyle(DefaultListStyle())
        } */
        
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                        if (!historyData.history.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2021}).isEmpty) {
                            VStack {
                                Text(String(calendar.monthSymbols[month-1]) + " " + String(year))
                                    .font(Font.custom("Sora-SemiBold", size: 15))
                                    .foregroundColor(StyleColors.titleText)
                                
                                ForEach(historyData.history.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2021}), id:\.id) { history in
                                    if history.status == false {
                                        NavigationLink(destination: PesananDetailView(history: history)) {
                                            PesananRow(history: history)
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
                historyData.getHistoryData(productData: productData)
            }
        }
    }
}

struct PesananView_Previews: PreviewProvider {
    static var previews: some View {
        PesananView()
    }
}
