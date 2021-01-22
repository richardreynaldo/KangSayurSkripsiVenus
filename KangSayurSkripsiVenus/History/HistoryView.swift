//
//  HistoryView.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 22/01/21.
//

import SwiftUI

struct HistoryView: View {
    private let calendar = Calendar.current
    private let year = Calendar.current.component(.year, from: Date())
    var body: some View {
        GeometryReader{
            geometry in
            ZStack{
                List{
                    ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
                        Section(header: Text(String(calendar.monthSymbols[month-1]) + " " + String(year))) {
                            Text("tes")
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
