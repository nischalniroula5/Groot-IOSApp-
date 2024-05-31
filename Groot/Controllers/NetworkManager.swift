//
//  NetworkManager.swift
//  Groot
//
//  Created by Nischal Niroula on 8/5/2024.
//

import Foundation

struct LoginResponse: Codable {
    var token: String
    var responseCode: String
    var responseDesc: String
    var email: String?
    var uid: String?
}

struct NetworkManager {
    static let shared = NetworkManager()
    let baseURL = URL(string: "http://localhost:8080")!
    
    func signUp(user: UserModel, password: String, completion: @escaping (Bool, Error?) -> Void) {
        let endpoint = baseURL.appendingPathComponent("/signup")
        
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
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let endpoint = baseURL.appendingPathComponent("/api/login")
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = [
            "email": email,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            print("Request URL: \(request.url!)")
            print("Request Body: \(String(data: request.httpBody!, encoding: .utf8) ?? "Invalid body")")
        } catch {
            print("Error serializing request body: \(error)")
            completion(.failure(error))
            return
        }
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                let errorResponse = error ?? NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No response from server"])
                completion(.failure(errorResponse))
                return
            }

            if httpResponse.statusCode != 200 {
                if let errorMessage = String(data: data, encoding: .utf8) {
                    print("Login failed: \(errorMessage)")
                }
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Login failed with status code: \(httpResponse.statusCode)"])))
                return
            }

            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()

    }
}
