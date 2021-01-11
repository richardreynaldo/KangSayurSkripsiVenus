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
    
    let userID = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    
    //Get user data
    func getUserData() {
        let docRef = db.collection("User").document(globalUserID)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                self.profile?.firstName = data?["firstName"] as? String ?? ""
                self.profile?.lastName = data?["lastName"] as? String ?? ""
                self.profile?.email = data?["email"] as? String ?? ""
                self.profile?.dob = data?["dob"] as? Date ?? Date()
                self.profile?.address = data?["address"] as? String ?? ""
            } else {
                print("Document does not exist")
            }
        }
    }
}
