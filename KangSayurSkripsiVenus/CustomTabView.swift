//
//  TabView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 19/01/21.
//

import SwiftUI

struct CustomTabView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Home", displayMode: .inline)
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            NavigationView {
                KeranjangView()
                    .navigationBarTitle("Keranjang", displayMode: .inline)
            }.tabItem {
                Image(systemName: "cart.fill")
                Text("Keranjang")
            }
            .tag(1)
            
            NavigationView {
                AkunView()
                    .navigationBarTitle("Akun", displayMode: .inline)
            }.tabItem {
                Image(systemName: "person.fill")
                Text("Akun")
            }
            .tag(2)
        }
        .accentColor(StyleColors.primaryRed)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}