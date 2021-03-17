//
//  SearchBar.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Cari sayur...", text: $text)
//                    .textCase(.lowercase)
                    .padding()
                    .padding(.horizontal, 32)
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        
                        
                            if isEditing{
                                if text.isEmpty == false {
                                    Button(action: {
                                        self.text = ""
                                    }, label: {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    })
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }){
                        Text("Cancel")
                    }
                    .padding(.trailing, 16)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
        .background(StyleColors.secondaryYellow)
    }
}
