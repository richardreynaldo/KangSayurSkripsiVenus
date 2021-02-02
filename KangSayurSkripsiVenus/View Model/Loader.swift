//
//  Loader.swift
//  KangSayurSkripsiVenus
//
//  Created by Rayhan Martiza Faluda on 02/02/21.
//

import Foundation

class Loader: ObservableObject {
    func showLoader() {
        isLoading = true
    }
    
    func removeLoader() {
        isLoading = false
    }
}
