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
    
    private var firstName: String = ""
    private var lastName: String = ""
    private var email: String = ""
    private var dob: Date = Date()
    private var address: [String] = []
    private var isAdmin: Bool = false
    
    func getUserData() {
        db.collection("User").document(globalUserID).getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                self.firstName = data?["firstName"] as? String ?? ""
                self.lastName = data?["lastName"] as? String ?? ""
                self.email = data?["email"] as? String ?? ""
                self.dob = data?["dob"] as? Date ?? Date()
                self.address = data?["address"] as? [String] ?? []
                self.isAdmin = data?["isAdmin"] as? Bool ?? false
                
                self.profile = Profile(userID: globalUserID, firstName: self.firstName, lastName: self.lastName, email: self.email, dob: self.dob, address: self.address, isAdmin: self.isAdmin)
                
                print("This is your profile: \(self.profile ?? Profile.default)")
                print("This is your userID: \(globalUserID)")
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
