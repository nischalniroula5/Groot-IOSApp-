//
//  TestMainView.swift
//  Groot
//
//  Created by Nischal Niroula on 30/4/2024.
//

import SwiftUI

struct TestMainView: View {
    var body: some View {
        TabView {
            Text("Home Tab")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Settings Tab")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


#Preview {
    TestMainView()
}
