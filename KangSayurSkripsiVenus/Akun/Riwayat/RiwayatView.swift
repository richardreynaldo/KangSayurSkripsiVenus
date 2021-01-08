////
////  RiwayatView.swift
////  KangSayurSkripsiVenus
////
////  Created by Venus Dhammiko on 08/01/21.
////
//
//import SwiftUI
//
//struct RiwayatView: View {
//    @State var count = 0
//    @State var currentMonth = 1
//    @State private var showAlert = false
//    @State private var deleteIndexSet: IndexSet?
//
//    private let calendar = Calendar.current
//    private let year = Calendar.current.component(.year, from: Date())
//
//    init() {
//        //MARK: Disable selection.
//        UITableView.appearance().allowsSelection = false
//        UITableViewCell.appearance().selectionStyle = .none
//    }
//
//    var body: some View {
//        ZStack {
//            List {
//                ForEach(Array(stride(from: 1, to: 13, by: 1)).reversed(), id:\.self) { month in
//                    if (!viewModel.journals.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2020}).isEmpty) {
//                        Section(header: Text(String(calendar.monthSymbols[month-1]) + " " + String(year))) {
//                            ForEach(viewModel.journals.filter({calendar.component(.month, from: $0.dateTime) ==  month && calendar.component(.year, from: $0.dateTime) ==  2020}), id:\.self) { journal in
//                                ZStack {
//                                    JournalRow(journal: journal)
//                                        .foregroundColor(.black)
//                                        .offset(x: -4)
//                                        .padding(.horizontal, -4)
//
//                                    NavigationLink(destination: JournalDetail(journal: journal)) {
//                                        EmptyView()
//                                    }
//                                }
//                                .alert(isPresented: $showAlert) {
//                                    Alert(title: Text("Delete Journal"), message: Text("Are you sure you want to delete this journal?"), primaryButton: .destructive(Text("Delete")) {
//                                        for index in deleteIndexSet! {
//                                            let item = viewModel.journals[index]
//                                            viewModel.deleteJournalData(journalId: item.id)
//                                            viewModel.journals.remove(at: index)
//                                        }
//                                    }, secondaryButton: .cancel())}
//                            }
//                            .onDelete(perform: delete)
//                        }
//                    }
//                }
////                .listRowBackground(StyleColors.secondaryYellow)
//            }
//            .listStyle(SidebarListStyle())
//
//        }
////        .background(StyleColors.secondaryYellow)
//        .edgesIgnoringSafeArea(.top)
//
//        .navigationBarTitle("Journal Entry", displayMode: .inline)
//
//        .onAppear() {
//            DispatchQueue.main.async {
////                viewModel.fetchData()
//            }
//        }
//    }
//
//    func delete(at offsets: IndexSet) {
//        showAlert = true
//        deleteIndexSet = offsets
//    }
//
//struct RiwayatView_Previews: PreviewProvider {
//    static var previews: some View {
//        RiwayatView()
//    }
//}
