//
//  UserModel.swift
//  Groot
//
//  Created by Nischal Niroula on 22/4/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct UserModel {
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var city: String
    var country: String

    var dictionary: [String: Any] {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phoneNumber": phoneNumber,
            "city": city,
            "country": country
        ]
    }
    
    // Initialize the UserModel with default empty values or specific ones
    init(firstName: String = "", lastName: String = "", email: String = "", phoneNumber: String = "", city: String = "", country: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.city = city
        self.country = country
    }
}

class UserViewModel {
    private let db = Firestore.firestore()
    
    func addUser(_ user: UserModel, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: password) { authResult, error in
            if let error = error {
                completion(false, error)
            } else if let uid = authResult?.user.uid {
                // Saving the user's details except the password
                self.db.collection("users").document(uid).setData(user.dictionary) { error in
                    if let error = error {
                        completion(false, error)
                    } else {
                        completion(true, nil)
                    }
                }
            }
        }
    }
}

