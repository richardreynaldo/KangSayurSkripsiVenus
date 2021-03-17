//
//  AlamatRow.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 09/01/21.
//

import SwiftUI

struct AlamatRow: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 108)
            
            VStack(alignment: .leading) {
                Text("Alamat Pengiriman")
                    .font(Font.custom("Sora-SemiBold", size: 20))
                    .foregroundColor(StyleColors.titleText)
                    .padding(.vertical, 4)
                
                Text("\(userData.profile!.address[0]), \(userData.profile!.address[1]) \(userData.profile!.address[2]), RT \(userData.profile!.address[3]) RW \(userData.profile!.address[4]), Kelurahan \(userData.profile!.address[5]), Kecamatan \(userData.profile!.address[6]), Kota \(userData.profile!.address[7]), \(userData.profile!.address[8]), \(userData.profile!.address[9])")
                    .font(Font.custom("Sora-Regular", size: 12))
                    .foregroundColor(StyleColors.secondaryTitleText)
                    .padding(.bottom, 8)
            }
            .offset(x: -12)
        }
    }
}

struct AlamatRow_Previews: PreviewProvider {
    static var previews: some View {
        AlamatRow()
    }
}
