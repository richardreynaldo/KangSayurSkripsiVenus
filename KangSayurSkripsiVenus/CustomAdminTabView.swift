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
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)
                .onAppear {
                    isLoading = true
                    DispatchQueue.main.async {
                        userData.getUserData()
                        historyData.getHistoryData(productData: productData)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            isLoading = false
                        }
                    }
                }
                
                if isLoading {
                    Rectangle()
                        .fill(Color.white.opacity(0.75))
                        .cornerRadius(15)
                        .shadow(color: Color(.lightGray), radius: 4, x: 0.0, y: 0.0)
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 5)
                    
                    ProgressView("Loading...")
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: StyleColors.primaryRed))
                        .foregroundColor(StyleColors.primaryRed)
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
