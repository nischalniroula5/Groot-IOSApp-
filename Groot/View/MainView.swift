//
//  MainView.swift
//  Groot
//
//  Created by Nischal Niroula on 30/4/2024.
//
import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 0
    @State private var showMenu = false
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeScreenView(showMenu: $showMenu)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favorites")
                    }
                    .tag(1)
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(3)
            }
            
            if showMenu {
                SideMenuView(showMenu: $showMenu)
                    .transition(.move(edge: .leading))
            }
        }
        .accentColor(darkBlue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ColorSchemeManager())
    }
}
