//
//  KangSayurSkripsiVenusApp.swift
//  KangSayurSkripsiVenus
//
//  Created by Laurentius Richard Reynaldo on 07/01/21.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct KangSayurSkripsiVenusApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            CustomTabView()
                .environmentObject(Authentication.shared)
                .environmentObject(UserData())
                .environmentObject(ProductData())
                .environmentObject(CartData())
        }
    }
}
