//
//  PesananRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 29/01/21.
//

import SwiftUI

struct PesananRow: View {
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
                Image(history.product.name)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text("\(history.dateTime, formatter: Self.dateFormat)")
                        .font(Font.custom("Sora-Light", size: 10))
                        .foregroundColor(StyleColors.captionSmall)
                        .padding(.top, 8)
                    
                    Text("\(history.product.name)")
                        .font(Font.custom("Sora-Bold", size: 15))
                        .foregroundColor(StyleColors.titleText)
                    
                    Text("Status: \(history.status ? "Delivered" : "Preparing")")
                        .font(Font.custom("Sora-Regular", size: 12))
                        .foregroundColor(StyleColors.titleText)
                        .padding(.bottom, 8)
                }
                .padding(.leading)
                
                 Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal)
        }
    }
}

struct PesananRow_Previews: PreviewProvider {
    static var previews: some View {
        PesananRow(history: History.example)
    }
}
