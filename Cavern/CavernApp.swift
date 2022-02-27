//
//  CavernApp.swift
//  Cavern
//
//  Created by Isaac Zahau on 1/29/22.
//

import SwiftUI
import Firebase

@main
struct CavernApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
