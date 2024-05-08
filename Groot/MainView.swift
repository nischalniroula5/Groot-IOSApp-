//
//  MainView.swift
//  Groot
//
//  Created by Nischal Niroula on 30/4/2024.
//
import SwiftUI

struct MainView: View {
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
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
         MainView()
    }
}
