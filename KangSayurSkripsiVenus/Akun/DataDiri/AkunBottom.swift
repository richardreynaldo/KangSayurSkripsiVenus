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
        VStack {
            HStack {
                Text("\(title)")
                    .font(Font.custom("Sora-SemiBold", size: 17))
                    .foregroundColor(StyleColors.titleText)
                
                Spacer()
            }
            .padding(.horizontal)
            
            HStack{
                TextField("", text: $input)
                    .font(Font.custom("Sora-Regular", size: 16))
                    .foregroundColor(StyleColors.secondaryTitleText)
                
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
                    .font(Font.custom("Sora-SemiBold", size: 17))
                    .foregroundColor(StyleColors.titleText)
                
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
