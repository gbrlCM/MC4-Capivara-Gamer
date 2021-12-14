//
//  UserRepository.swift
//  Capivara
//
//  Created by Vitor Cheung on 14/12/21.
//

import Foundation

struct UserRepository: UserRepositoryProtocol {
    func login(_ user: User) async throws {

    }
    
    func retrieveUser(userId: String) async throws -> User {
        return UserMock.gamerCapibara
    }
    
    
    func deleteUser(userId: String) async throws {
        guard let url = URL(string: "https://capivara-back.herokuapp.com/user/\(userId)/delete") // Mostra o caminho do back
        else {
            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
    }
    
}
