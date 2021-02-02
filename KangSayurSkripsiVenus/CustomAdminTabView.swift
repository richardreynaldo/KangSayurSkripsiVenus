//
//  CustomAdminTabView.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 28/01/21.
//

import SwiftUI

struct CustomAdminTabView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var productData: ProductData
    @EnvironmentObject var historyData: HistoryData
    
    @State private var currentTab: Int = 0
    @State private var isLoading: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                TabView(selection: $currentTab) {
                    NavigationView {
                        StokView()
                            .navigationBarTitle("Stok", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "list.number")
                        Text("Stok")
                    }
                    .tag(0)
                    
                    NavigationView {
                        PesananView()
                            .navigationBarTitle("Pesanan", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Pesanan")
                    }
                    .tag(1)
                    
                    NavigationView {
                        AkunView()
                            .navigationBarTitle("Akun", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Akun")
                    }
                    .tag(2)
                }
                .onAppear {
                    DispatchQueue.main.async {
                        historyData.getHistoryData(productData: productData)
                    }
                }
            }
        }
    }
}

struct CustomAdminTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAdminTabView()
    }
}
