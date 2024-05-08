//
//  LoginScreen.swift
//  Groot
//
//  Created by Nischal Niroula on 15/4/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
//import FirebaseAuth

struct LoginScreen: View {
    var primaryColor = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingLoginFailedAlert = false
    @State private var loginErrorMessage = ""
    @State private var isAuthenticated = false
    
    @State private var showingHomeScreen = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Image("GrootLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                // Welcome Text
                VStack {
                    HStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                            .foregroundColor(primaryColor)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Welcome to Groot! Sign in to continue your cultural journey and connect with your community")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(primaryColor)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                
                
                
                // Email Field
                TextField("Your Email", text: $email)
                    .padding()
                    .background(Color.secondary.opacity(0.3))
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
                    .padding(.horizontal)
                
                // Password Field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.secondary.opacity(0.3))
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                
                // Login Button
                Button(action: {
                    login()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 365, height: 65)
                        .background(primaryColor)
                        .cornerRadius(5.0)
                        .padding(.top, 20)
                }
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign Up Here")
                        .font(.footnote)
                        .foregroundColor(primaryColor)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showingHomeScreen) {
                MainView()
            }
            
            
        }
        .alert(isPresented: $showingLoginFailedAlert) {
            Alert(
                title: Text("Login Failed"),
                message: Text("Either email or password is not correct. Please check and try again."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    
    func login() {
        NetworkManager.shared.login(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Print the token to the console for testing
                    print("Login successful, token: \(response.token)")
                    
                    // Optionally store the token if needed
                    // UserDefaults.standard.set(response.token, forKey: "userToken")
                    
                    self.showingHomeScreen = true
                case .failure(let error):
                    self.loginErrorMessage = "Authentication failed: \(error.localizedDescription)"
                    self.showingLoginFailedAlert = true
                }
            }
        }
    }


}
    
   

#Preview {
    LoginScreen()
}
