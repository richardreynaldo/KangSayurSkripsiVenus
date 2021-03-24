//
//  DataDiriView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct DataDiriView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var dobString: String = ""
    @State var dob: Date = Date()
    
    func inputDataFromViewModel() {
        firstName = userData.profile?.firstName ?? ""
        lastName = userData.profile?.lastName ?? ""
        dob = userData.profile?.dob ?? Date()
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ViewBottom(title: "Nama depan", input: $firstName)
                        .padding(.bottom)
                    
                    ViewBottom(title: "Nama belakang", input: $lastName)
                        .padding(.bottom)
                    
                    DatePicker(selection: $dob, in: ...Date(), displayedComponents: .date) {
                        Text("Birthdate")
                            .font(Font.custom("Sora-SemiBold", size: 17))
                            .foregroundColor(StyleColors.titleText)
                    }
                    .padding(.horizontal)

                    Divider()
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
        .onAppear {
            inputDataFromViewModel()
        }
        .navigationBarTitle("Change Info", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            DispatchQueue.main.async {
                userData.changeUserInfo(firstName: firstName, lastName: lastName, dob: dob)
                userData.getUserData()
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("Done")
        })
    }
}


struct DataDiriView_Previews: PreviewProvider {
    static var previews: some View {
        DataDiriView()
    }
}
