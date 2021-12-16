//
//  UserRepository.swift
//  Capivara
//
//  Created by Vitor Cheung on 14/12/21.
//

import Foundation

struct UserRepository: UserRepositoryProtocol {
    func login(_ user: User) async throws -> User {
        guard let url = URL(string: "https://capivara-back.herokuapp.com/user/create") else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        print("body \n")
        encoder.dateEncodingStrategy = .iso8601
        request.httpBody = try encoder.encode(user)
        print(String(data: request.httpBody!, encoding: .utf8))
        
        let (data, _) = try await URLSession.shared.data(for: request)
        print("response \n")
        print(String(data: data, encoding: .utf8))
        let decodedData = try JSONDecoder().decode(User.self, from: data)
        return decodedData
    }
    
    func retrieveUser(userId: String) async throws -> User {
        let user = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/user/AppleId/\(userId)", decodeTo: User.self)
        return user
    }
    
    func deleteUser(userId: String) async throws {
        guard let url = URL(string: "https://capivara-back.herokuapp.com/user/\(userId)/delete") // Mostra o caminho do back
        else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else { return }
        if httpResponse.statusCode != 200 {
            throw NSError(domain: "Unvalid response", code: httpResponse.statusCode, userInfo: nil)
        }
    }
    
}
