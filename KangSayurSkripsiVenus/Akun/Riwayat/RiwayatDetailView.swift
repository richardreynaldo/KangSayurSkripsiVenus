//
//  RiwayatDetailView.swift
//  KangSayurSkripsiVenus
//
//  Created by Venus Dhammiko on 08/01/21.
//

import SwiftUI

struct RiwayatDetailView: View {
    @State private var isActionSheetShow = false
    @State private var showAlert = false
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "d MMMM yyyy"
        return formatter
    }()
    
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    // MARK: Initializers
//    init(journal: Journal) {
        // this is not the same as manipulating the proxy directly
        /*let appearance = UINavigationBarAppearance()
         
         // this overrides everything you have set up earlier.
         appearance.configureWithTransparentBackground()
         
         // this applies custom background color
         appearance.backgroundColor = .white
         
         // this only applies to big titles
         appearance.largeTitleTextAttributes = [
         .font : StyleFont.largeTitle,
         NSAttributedString.Key.foregroundColor : UIColor(StyleColors.titleColor)
         ]
         // this only applies to small titles
         appearance.titleTextAttributes = [
         .font : StyleFont.smallTitle,
         NSAttributedString.Key.foregroundColor : UIColor(StyleColors.titleColor)
         ]
         
         // In the following two lines you make sure that you apply the style for good
         UINavigationBar.appearance().scrollEdgeAppearance = appearance
         UINavigationBar.appearance().standardAppearance = appearance
         
         // This property is not present on the UINavigationBarAppearance
         // object for some reason and you have to leave it til the end
         UINavigationBar.appearance().tintColor = .white*/
        
        // List clear background color
//        UITableView.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
//        UITableViewCell.appearance().backgroundColor = UIColor(StyleColors.secondaryYellow)
        
//        self.journal = journal
//    }
    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .center) {
                //INI DI TENGAH TARO GAMBAR PRODUK AJA
//                Text("\(journal.dateTime, formatter: Self.dateFormat)")
//                    .textCase(.uppercase)
//                    .font(StyleFont.heading1)
//                    .foregroundColor(StyleColors.secondaryPurple)
                
                VStack(alignment: .leading){
                    Group{
                        Text("Informasi Produk")
    //                        .font(StyleFont.heading2)
    //                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
    //                        .padding(.init(top: 7, leading: 0, bottom: 2, trailing: 0))
                        Text("Nama : ") //nama produk
                        Text("Kuantitas : ") //berat produk
                        Text("Harga") //harga produk
    //                        .font(StyleFont.body)
    //                        .foregroundColor(StyleColors.accountPageBodyText)
    //                        .padding(.init(top: 7, leading: 0, bottom: 17, trailing: 0))
                        
                        Divider()
                    }
                    Group{
                        Text("Detail Order")
    //                        .font(StyleFont.heading2)
    //                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
    //                        .padding(.init(top: 7, leading: 0, bottom: 2, trailing: 0))
                        Text("Id : ") //id order
                        Text("Tanggal : ") //tanggal order
                        Text("Waktu : ") //waktu order
                        Text("Status : ") //status order
                        Text("Total : ") //total order
                        
                        Divider()
                    }
                    Group{
                        Text("Alamat")
    //                        .font(StyleFont.heading2)
    //                        .foregroundColor(StyleColors.accountPageLargeTitleH1H2Text)
    //                        .padding(.init(top: 7, leading: 0, bottom: 2, trailing: 0))
                        Text(/* Masukkin alamat disini*/"")
                        Divider()
                    }
                }
            }
//                .listRowBackground(StyleColors.secondaryYellow)
        }
            .padding(24)
        }
//INI NAVIGATION YANG BUAT APUS RIWAYAT GA USAH DI PAKE KARENA RIWAYATNYA GA BOLEH DI APUS.
//      .navigationBarTitle(journal.title, displayMode: .large)
//        .navigationBarItems(trailing: Button(action: {
//            isActionSheetShow = true
//        }) {
//                Image(systemName: "ellipsis")
//                    .frame(width: 40, height: 40)
//        }
//        .actionSheet(isPresented: $isActionSheetShow) { () -> ActionSheet in
//            showActionSheet(withTitle: /* ini isinya nama sayur aja */, message: "Apa yang ingin anda lakukan?")
//        })
//        .fullScreenCover(isPresented: $isShowingEditingView) {
//            JournalEditor(isShowingEditingView: $isShowingEditingView, isPresented: $isShowingJournalingView, journal: journal)
//                .accentColor(StyleColors.primaryRed)
//        }
//        .alert(isPresented:$showAlert) {
//            Alert(title: Text("Hapus Riwayat"), message: Text("Anda yakin ingin menhapus riwayat?"), primaryButton: .destructive(Text("Hapus")) {
//                print(journal.id)
//                viewModel.deleteJournalData(journalId: journal.id)
//                showAlert = false
//                presentationMode.wrappedValue.dismiss()
//            }, secondaryButton: .cancel())}
    }

//INI JUGA GA KEPAKE KARENA RIWAYAT GA BOLEH DI APUS
//private func showActionSheet(withTitle: String, message: String) -> ActionSheet {
//
//        return ActionSheet(title: Text(withTitle), message: Text(message), buttons: [
//            .destructive(Text("Hapus Riwayat"), action: {
//                showAlert = true
//                print("Destructive tapped")
//            }),
//
//            .cancel(Text("Batal"), action: {
//                print("Cancel tapped")
//            })
//        ])
//}


struct RiwayatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatDetailView()
    }
}
