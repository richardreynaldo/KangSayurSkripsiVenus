//
//  AkunView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct AkunView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    NavigationLink(
                        destination: DataDiriView())
                    {
                        AkunChevron(title: "Data Diri")
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: DataAlamatView())
                    {
                        AkunChevron(title: "Data Alamat")
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: UbahEmailView())
                    {
                        AkunChevron(title: "Ubah Email")
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(
                        destination: UbahKataSandiView())
                    {
                        AkunChevron(title: "Ubah Kata Sandi")
                            .padding(.horizontal)
                    }
                    
//                    NavigationLink(
//                        destination: RiwayatView())
//                    {
//                        AccountChevron(title: "Lihat Riwayat Pemesanan")
//                            .padding(.horizontal)
//                    }
                    
                    
                    Spacer()
                    
                }
                .padding(.top, 30)
            }
        }
    }
}

struct AkunView_Previews: PreviewProvider {
    static var previews: some View {
        AkunView()
    }
}
