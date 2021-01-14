//
//  UserData.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserData: ObservableObject {
    @Published var profile: Profile?
    
    private let userID = Auth.auth().currentUser?.uid
    private var db = Firestore.firestore()
    
    func getUserData() {
        db.collection("User").document(globalUserID).getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                self.profile?.firstName = data?["firstName"] as? String ?? ""
                self.profile?.lastName = data?["lastName"] as? String ?? ""
                self.profile?.email = data?["email"] as? String ?? ""
                self.profile?.dob = data?["dob"] as? Date ?? Date()
                self.profile?.address = data?["address"] as? [String] ?? []
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func changeUserInfo(firstName: String, lastName: String, dob: Date) {
        db.collection("User").document(globalUserID).updateData([
            "firstName": firstName,
            "lastName": lastName,
            "dob": dob
        ]) { err in
            if let err = err {
                print("Error changing user info: \(err)")
            } else {
                print("User info successfully changed!")
            }
        }
    }
    
    func changeUserAddress(address: [String]) {
        db.collection("User").document(globalUserID).updateData([
            "address": address
        ]) { err in
            if let err = err {
                print("Error changing user address: \(err)")
            } else {
                print("User info successfully changed!")
            }
        }
    }
}
