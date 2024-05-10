//
//  ProfileView.swift
//  Groot
//
//  Created by Nischal Niroula on 24/4/2024.
//

import SwiftUI

struct ProfileView: View {
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    var body: some View {
        NavigationView {
            List {
                // User Info Section
                
                    VStack(alignment: .leading) {
                        Text("Nischal Niroula")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(darkBlue)
                        
                        Text("officialNischalNiroula@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(darkBlue)
                    }
                

                // Menu Options
                Section {
                    NavigationLink(destination: NotificationsView()) {
                        Label("Notifications", systemImage: "bell.fill").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: FavouritesView()) {
                        Label("Favourites", systemImage: "heart.fill").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: Text("Suggestions View")) {
                        Label("Suggestions", systemImage: "star.fill").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: Text("Offers View")) {
                        Label("Offers", systemImage: "tag.fill").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: Text("Refer a Friend View")) {
                        Label("Refer a Friend", systemImage: "person.crop.circle.badge.plus.fill").foregroundColor(darkBlue)
                    }
                }
                .padding(.bottom, 10)

                HStack{
                    Button(action: {
                        // Action for Editing profile
                    }) {
                        Text("Edit Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(darkBlue)
                            .cornerRadius(10)
                    }
                    Spacer()
                    Button(action: {
                        // Action for Editing profile
                    }) {
                        Text("Log Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(darkBlue)
                            .cornerRadius(10)
                    }
                }
            
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

