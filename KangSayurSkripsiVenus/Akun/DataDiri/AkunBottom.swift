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
            .padding(.horizontal, 32)
            
            HStack{
                TextField("", text: $input)
                Spacer()
            }
            .padding(.horizontal, 32)
            
            Divider()
                .padding(.horizontal, 32)
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
            .padding(.horizontal, 32)
            
            HStack{
                SecureField("", text: $input)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                Spacer()
            }
            .padding(.horizontal, 32)
            
            Divider()
                .padding(.horizontal, 32)
        }
    }
}

//struct AkunBottom_Previews: PreviewProvider {
//    static var previews: some View {
//        AkunBottom()
//    }
//}
