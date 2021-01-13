//
//  AkunChevron.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct AkunChevron: View {
    var title:String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
            
            HStack {
                Text("\(title)")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
        }
    }
}

struct AkunChevron_Previews: PreviewProvider {
    static var previews: some View {
        AkunChevron(title: "View")
    }
}
