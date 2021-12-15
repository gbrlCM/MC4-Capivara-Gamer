//
//  AuthenticationService.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 13/12/21.
//

import Foundation
import Combine
import AuthenticationServices

final class AutheticationService: ObservableObject {
    
    @Published
    var loggedUser: User?
    
    let userPublisher: CurrentValueSubject<User?, Never>
    
    private let userRepository: UserRepositoryProtocol
    private let keychainService: KeyChainServiceProtocol
    
    private let credentialKey = "userCredential"
    private let serviceKey = "com.gbrlcm.capivara"
    
    
    init(repository: UserRepositoryProtocol, keychainService: KeyChainServiceProtocol) {
        self.loggedUser = nil
        self.userRepository = repository
        self.keychainService = keychainService
        userPublisher = .init(nil)
    }
    
    func signIn(credentials :ASAuthorizationAppleIDCredential) async throws {
        let userId = credentials.user
        let firstName = credentials.fullName?.givenName
        let lastName = credentials.fullName?.familyName
        let fullName = "\(firstName ?? "Capivarinha") \(lastName ?? "")"
        
        let newUser = User(id: nil,
                           userName: fullName,
                           avatar: "",
                           dateOfBirth: Date(),
                           appleId: userId)
        
        do {
            try keychainService.set(userId, forKey: credentialKey, inService: serviceKey)
            let user = try await userRepository.login(newUser)
            userPublisher.send(user)
            
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func login() async throws {
        do {
            let userId = try keychainService.get(forKey: credentialKey, inService: serviceKey)
            let user = try await userRepository.retrieveUser(userId: userId)
            userPublisher.send(user)
        } catch {
            throw error
        }
    }
    
    func logout() throws {
        guard loggedUser != nil else {
            throw NSError(domain: "User not loggedIn", code: 3, userInfo: nil)
        }
        
        do {
            try keychainService.delete(forKey: credentialKey, inService: serviceKey)
            userPublisher.send(nil)
        } catch  {
            throw error
        }
    }
    
    func deleteAccount() async throws {
        guard let loggedUser = loggedUser else {
            return
        }
        
        do {
            try logout()
            try await userRepository.deleteUser(userId: loggedUser.appleId)
        } catch {
            throw error
        }
    }
    
}
