//
//  AkunBottom.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct ViewBottom: View {
    var title: String
    @Binding var input: String
    
    var body: some View {
        VStack
        {
            HStack{
                Text("\(title)")
                Spacer()
            }
            .padding(.horizontal)
            
            HStack{
                TextField("", text: $input)
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
        }
    }
}

struct PasswordBottom: View {
    var title: String
    @Binding var input: String
    
    var body: some View {
        VStack
        {
            HStack{
                Text("\(title)")
//                    .font(StyleFont.heading2)
//                    .foregroundColor(StyleColors.accountPageCaptionSmall)
                Spacer()
            }
            .padding(.horizontal)
            
            HStack{
                SecureField("", text: $input)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
        }
    }
}

//struct AkunBottom_Previews: PreviewProvider {
//    static var previews: some View {
//        AkunBottom()
//    }
//}
