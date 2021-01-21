//
//  Authentication.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 11/01/21.
//

import Foundation
import AuthenticationServices
import FirebaseAuth
import FirebaseFirestore

class Authentication: NSObject, ObservableObject {
    @Published var profile: Profile?
    @Published var loggedInUser: User?
    @Published var isAuthenticating = false
    @Published var error: NSError?
    
    private let auth = Auth.auth()
    private let userID = Auth.auth().currentUser?.uid
    private var db = Firestore.firestore()
    
    static let shared = Authentication()
    
    // Authentication State
    override private init() {
        loggedInUser = auth.currentUser
        globalUserID = auth.currentUser?.uid ?? ""
        super.init()
        
        auth.addStateDidChangeListener(authStateChanged)
    }
    
    private func authStateChanged(with auth: Auth, user: User?) {
        guard user != self.loggedInUser else { return }
        loggedInUser = user
        globalUserID = user?.uid ?? ""
    }
    
    func signUp(firstName: String, lastName: String, email: String, dob: Date, address: [String], password: String) {
        isAuthenticating = true
        error = nil
        
        auth.createUser(withEmail: email, password: password) { (auth, error) in
            DispatchQueue.main.async {
                self.isAuthenticating = false
                
                if let user = auth?.user {
                    self.loggedInUser = user
                    self.db.collection("User").document(user.uid).setData([
                        "firstName": firstName,
                        "lastName": lastName,
                        "email": email,
                        "dob": dob,
                        "address": address,
                        "isAdmin": false
                    ]) { err in
                        if let err = err {
                            print("Error adding user: \(err)")
                        } else {
                            print("User added with ID: \(user.uid)")
                        }
                    }
                } else if let error = error {
                    self.error = error as NSError
                }
            }
        }
    }
    
    func signIn(email: String, password: String) {
        isAuthenticating = true
        error = nil
        
        auth.signIn(withEmail: email, password: password) { (auth, error) in
            DispatchQueue.main.async {
                self.isAuthenticating = false
                if let user = auth?.user {
                    self.loggedInUser = user
                    print("Sign in successful with \(String(describing: self.loggedInUser))")
                    globalUserID = user.uid
                } else if let error = error {
                    self.error = error as NSError
                }
            }
        }
    }
    
    func signout() {
        try? auth.signOut()
    }
    
    func changeEmail(currentEmail: String, newEmail: String, currentPassword: String, completion: @escaping (Error?) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: currentEmail, password: currentPassword)
        Auth.auth().currentUser?.reauthenticate(with: credential, completion: { (result, error) in
            if let error = error {
                completion(error)
            }
            else {
                Auth.auth().currentUser?.updateEmail(to: newEmail) { (error) in
                    self.db.collection("User").document(globalUserID).updateData([
                        "email": newEmail
                    ]) { err in
                        if let err = err {
                            print("Error adding caregiver to patient: \(err)")
                        } else {
                            print("Caregiver successfully added to patient!")
                        }
                    }
                    completion(error)
                }
            }
        })
    }
    
    func changePassword(email: String, currentPassword: String, newPassword: String, completion: @escaping (Error?) -> Void) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
        Auth.auth().currentUser?.reauthenticate(with: credential, completion: { (result, error) in
            if let error = error {
                completion(error)
            }
            else {
                Auth.auth().currentUser?.updatePassword(to: newPassword, completion: { (error) in
                    completion(error)
                })
            }
        })
    }
    
    func tempSignUp(firstName: String, lastName: String, email: String, dob: Date, password: String) {
        profile?.firstName = firstName
        profile?.lastName = lastName
        profile?.email = email
        profile?.dob = dob
    }
    
    func tempAddAddress(address: [String]) {
        profile?.address = address
    }
}
