//
//  SideMenuView.swift
//  Groot
//
//  Created by Nischal Niroula on 21/5/2024.
//
import SwiftUI

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userName: String = ""
    @Published var email: String = ""
}

var customRed = Color(red: 255 / 255.0, green: 136 / 255.0, blue: 137 / 255.0)

struct SideMenuView: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var userSession: UserSession
    @State private var showingLoginScreen = false
    
    var darkBlue = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if showMenu {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            // User info or Login button
                            if userSession.isLoggedIn {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(userSession.userName)
                                            .font(.headline)
                                            .foregroundColor(.dynamicText)
                                        Text(userSession.email)
                                            .font(.subheadline)
                                            .foregroundColor(.dynamicText)
                                    }
                                    Spacer()
                                }
                                .padding([.top, .horizontal])
                                .padding(.bottom)
                            } else {
                                Button(action: {
                                    withAnimation {
                                        self.showMenu = false
                                    }
                                    self.showingLoginScreen = true
                                }) {
                                    Text("Login")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(darkBlue)
                                        .cornerRadius(10)
                                }
                                .padding([.top, .horizontal])
                                .padding(.bottom)
                            }
                            
                            // Menu items
                            MenuItem(icon: "house.fill", text: "Home", isSelected: true, destination: AnyView(HomeScreenView(showMenu: $showMenu)))
                            MenuItem(icon: "bell", text: "Notifications", badge: 2, destination: AnyView(NotificationsView()))
                            MenuItem(icon: "heart", text: "Favourites", destination: AnyView(FavoritesView()))
                            MenuItem(icon: "lightbulb", text: "Suggestions", destination: AnyView(SuggestionsView()))
                            MenuItem(icon: "tag", text: "Offers", badge: 2, destination: AnyView(OffersView()))
                            MenuItem(icon: "person", text: "Refer a Friend", destination: AnyView(ReferAFriendView()))
                            MenuItem(icon: "phone", text: "Support", destination: AnyView(Text("Support View")))
                            
                            Spacer()
                        }
                        .frame(width: geometry.size.width * 0.75, alignment: .leading)
                        .background(Color.dynamicBackground)
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                        
                        Spacer()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showingLoginScreen) {
            LoginScreen(isAuthenticated: $userSession.isLoggedIn)
        }
    }
}

struct MenuItem: View {
    var icon: String
    var text: String
    var isSelected: Bool = false
    var badge: Int? = nil
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? .white : .dynamicText)
                Text(text)
                    .foregroundColor(isSelected ? .white : .dynamicText)
                Spacer()
                if let badge = badge, badge > 0 {
                    Text("\(badge)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(customRed)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(isSelected ? Color.dynamicText : Color.clear)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showMenu: .constant(true))
            .environmentObject(UserSession())
    }
}
