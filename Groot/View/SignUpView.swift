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
            
            // Welcome Text
            HStack {
                VStack(alignment: .leading) {
                    Text("Create Your Account")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(primaryColor)
                    
                    Text("Please enter following details:")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(primaryColor)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                    TextField("Phone Number", text: $phoneNumber)
                    TextField("City", text: $city)
                    TextField("Country", text: $country)
                    
                    Divider()
                    
                    SecureField("Password", text: $password)
                     
                    SecureField("Confirm Password", text: $confirmPassword)
                       
                    
                    Spacer().frame(height: 20)
                }
                .padding()
                //.background(Color.secondary.opacity(0.3))
                .cornerRadius(5.0)
            }
            .navigationBarHidden(true)
            
            Button("Sign Up", action: signUp)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(primaryColor)
                .cornerRadius(5.0)
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
    
    //This is firebase AUth SIgn Up
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
    
    //This is SignUp connected with backend GRoot API
    
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
