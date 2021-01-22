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
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: 160)
            
            VStack(alignment: .leading){
                Text("Alamat Pengiriman")
                    .font(.title)
                    .padding([.top, .bottom, .trailing], 8)
                
                Text("\(userData.profile!.address[0]), \(userData.profile!.address[1]) \(userData.profile!.address[2]), RT \(userData.profile!.address[3]) RW \(userData.profile!.address[4]), Kelurahan \(userData.profile!.address[5]), Kecamatan \(userData.profile!.address[6]), Kota \(userData.profile!.address[7]), \(userData.profile!.address[8]), \(userData.profile!.address[9])")
                    .padding([.top, .bottom, .trailing], 8)
            }
        }
    }
}

struct AlamatRow_Previews: PreviewProvider {
    static var previews: some View {
        AlamatRow()
    }
}
