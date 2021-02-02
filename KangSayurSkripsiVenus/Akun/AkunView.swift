//
//  AkunView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct AkunView: View {
    @EnvironmentObject var authentication: Authentication
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    NavigationLink(
                        destination: RiwayatView())
                    {
                        AkunChevron(title: "Riwayat")
                            .foregroundColor(StyleColors.titleText)
                            .padding(.horizontal)
                    }
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
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingAlert = true
                    }, label: {
                        AkunChevron(title: "Keluar")
                            .padding(.horizontal)
                    })
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("Keluar?"), message: Text("Apakah anda yakin ingin keluar?"), primaryButton: .destructive(Text("Ya")) {
                            DispatchQueue.main.async {
                                authentication.signout()
                            }
                        }, secondaryButton: .cancel(Text("Tidak")))}
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
