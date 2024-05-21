import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SignUpView: View {
    var primaryColor = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var city: String = ""
    @State private var country: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State private var signupFailedAlert = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            // Logo
            Image("GrootLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 30)
                .padding(.top, 20)
            
            // Welcome Text
            HStack {
                VStack(alignment: .leading) {
                    Text("Create Your Account")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(primaryColor)
                    
                    Text("Please enter the following details:")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(primaryColor)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    
                    // First Name
                    VStack(alignment: .leading, spacing: 5) {
                        Text("First Name")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // Last Name
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Last Name")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // Email
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Email")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // Phone Number
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Phone Number")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("Phone Number", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // City
                    VStack(alignment: .leading, spacing: 5) {
                        Text("City")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("City", text: $city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // Country
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Country")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        TextField("Country", text: $country)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    Divider().padding(.horizontal)
                    
                    // Password
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    // Confirm Password
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Confirm Password")
                            .font(.subheadline)
                            .foregroundColor(primaryColor)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    Spacer().frame(height: 20)
                }
                .padding(.top, 10)
            }
            .navigationBarHidden(true)
            .padding()
            
            Button("Sign Up", action: signUp)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(primaryColor)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 20)
            
            Button("Already have an account? Login Instead", action: {
                presentationMode.wrappedValue.dismiss()
            })
            .font(.footnote)
            .foregroundColor(primaryColor)
            .padding(.top, 10)
        }
        .alert(isPresented: $signupFailedAlert) {
            Alert(title: Text("Registration Failed"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    // Firebase Auth Sign Up
    /*
    func signUp() {
        if password != confirmPassword {
            self.errorMessage = "Passwords do not match"
            self.signupFailedAlert = true
            return
        }
        
        let userModel = UserModel(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, city: city, country: country)
        
        UserViewModel().addUser(userModel, password: password) { success, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.signupFailedAlert = true
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    */
    
    // SignUp connected with backend GRoot API
    func signUp() {
        if password != confirmPassword {
            self.errorMessage = "Passwords do not match"
            self.signupFailedAlert = true
            return
        }
        
        let userModel = UserModel(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, city: city, country: country)
        
        NetworkManager.shared.signUp(user: userModel, password: password) { success, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    self.signupFailedAlert = true
                } else {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
