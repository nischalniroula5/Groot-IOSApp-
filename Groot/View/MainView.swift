//
//  MainView.swift
//  Groot
//
//  Created by Nischal Niroula on 30/4/2024.
//
import SwiftUI

struct MainView: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            FavouritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
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
        .accentColor(darkBlue)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
         MainView()
    }
}
