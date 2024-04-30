//
//  GrootApp.swift
//  Groot
//
//  Created by Nischal Niroula on 7/4/2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct GrootApp: App {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    var unselectedItemColor = Color(red: 0.341, green: 0.569, blue: 0.663)
    
    init(){
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "unselectedItemColor")
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            OnboardingSplashView()
        }
    }
}

