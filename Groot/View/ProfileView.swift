//
//  ProfileView.swift
//  Groot
//
//  Created by Nischal Niroula on 24/4/2024.
//
import SwiftUI

struct ProfileView: View {
    @State private var showLoginScreen = false
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
                    
                    Text("nischalniroula5@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(darkBlue)
                }

                // Menu Options
                Section {
                    NavigationLink(destination: NotificationsView()) {
                        Label("Notifications", systemImage: "bell").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: FavoritesView()) {
                        Label("Favourites", systemImage: "heart").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: SuggestionsView()) {
                        Label("Suggestions", systemImage: "star").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: OffersView()) {
                        Label("Offers", systemImage: "tag").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: ReferAFriendView()) {
                        Label("Refer a Friend", systemImage: "person.crop.circle.badge.plus").foregroundColor(darkBlue)
                    }
                    NavigationLink(destination: Text("Add A Business")) {
                        Label("Add A Business", systemImage: "storefront").foregroundColor(darkBlue)
                    }
                }
                .padding(.bottom, 10)

                HStack {
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
                        self.showLoginScreen = true
                    }) {
                        Text("Log Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(darkBlue)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: $showLoginScreen) {
                        LoginScreen()
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
