//
//  AkunView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct AkunView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    NavigationLink(
                        destination: DataDiriView())
                    {
                        AkunChevron(title: "Data Diri")
                            .foregroundColor(StyleColors.titleText)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: DataAlamatView())
                    {
                        AkunChevron(title: "Data Alamat")
                            .foregroundColor(StyleColors.titleText)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: UbahEmailView())
                    {
                        AkunChevron(title: "Ubah Email")
                            .foregroundColor(StyleColors.titleText)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: UbahKataSandiView())
                    {
                        AkunChevron(title: "Ubah Kata Sandi")
                            .foregroundColor(StyleColors.titleText)
                            .padding(.horizontal)
                    }
                    
//                    NavigationLink(
//                        destination: RiwayatView())
//                    {
//                        AccountChevron(title: "Lihat Riwayat Pemesanan")
//                            .padding(.horizontal)
//                    }
                    
                    Spacer()
                    
                    Button(action: {
                        authentication.signout()
                    }, label: {
                        AkunChevron(title: "Keluar")
                            .padding(.horizontal)
                    })
                }
                .padding(.top, 20)
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}

struct AkunView_Previews: PreviewProvider {
    static var previews: some View {
        AkunView()
    }
}
