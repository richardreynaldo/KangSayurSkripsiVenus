//
//  DataDiriView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct DataDiriView: View {
    @State var nama: String = ""
    @State var email: String = ""
    @State var dobString: String = ""
    @State var dob: Date = Date()
    
    func inputDataFromViewModel(){
//        buat isi data diri pas dibuka entar dari core data
//        firstName = viewModel.profile.firstName ?? ""
//        lastName = viewModel.profile.lastName ?? ""
//        jgn lupa gabungin nama depan sama nama belakang buat jadi full name
//        dob = viewModel.profile.dob ?? Date()
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ViewBottom(title: "Nama", input: $nama)
                        .padding(.bottom)
                    
                    ViewBottom(title: "Email", input: $email)
                        .padding(.bottom)
                    
                    ViewBottom(title: "Tanggal Lahir", input: $dobString)
                        .padding(.bottom)
                    
                    Spacer()
                }
                .padding(.top, 108)
            }
        }
        .onAppear {
            //dob = viewModel.profile.dob ?? Date() //Ini buat Tanggal lahir pake core data entar
        }
        .navigationBarTitle("Change Info", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            
            DispatchQueue.main.async {
                //masukkin func yang buat update infonya sama dismiss jgn lupa
            }
            
        }) {
            Text("Done")
        })
        .edgesIgnoringSafeArea(.top)
    }
}


struct DataDiriView_Previews: PreviewProvider {
    static var previews: some View {
        DataDiriView()
    }
}
