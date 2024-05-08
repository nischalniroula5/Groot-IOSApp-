//
//  NetworkManager.swift
//  Groot
//
//  Created by Nischal Niroula on 8/5/2024.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    let baseURL = URL(string: "http://localhost:8080/signup")!

    func signUp(user: UserModel, password: String, completion: @escaping (Bool, Error?) -> Void) {
        let endpoint = baseURL.appendingPathComponent("users")
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "phoneNumber": user.phoneNumber,
            "city": user.city,
            "country": user.country,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            completion(false, error)
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode == 200 else {
                completion(false, error)
                return
            }
            completion(true, nil)
        }.resume()
    }
}
