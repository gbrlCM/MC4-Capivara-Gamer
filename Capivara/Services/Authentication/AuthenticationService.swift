//
//  AuthenticationService.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 13/12/21.
//

import Foundation
import AuthenticationServices

final class AutheticationService: ObservableObject {
    
    @Published
    var loggedUser: User?
    
    private let userRepository: UserRepositoryProtocol
    private let keychainService: KeyChainServiceProtocol
    
    private let credentialKey = "userCredential"
    private let serviceKey = "com.gbrlcm.capivara"
    
    init(repository: UserRepositoryProtocol, keychainService: KeyChainServiceProtocol) {
        self.loggedUser = nil
        self.userRepository = repository
        self.keychainService = keychainService
    }
    
    func signIn(credentials :ASAuthorizationAppleIDCredential) async throws {
        let userId = credentials.user
        let firstName = credentials.fullName?.givenName
        let lastName = credentials.fullName?.familyName
        let fullName = "\(firstName ?? "") \(lastName ?? "")"
        
        let newUser = User(id: nil,
                           username: fullName,
                           avatar: "",
                           description: "",
                           dateOfBirth: Date(),
                           appleId: userId)
        
        do {
            try keychainService.set(userId, forKey: credentialKey, inService: serviceKey)
            try await userRepository.login(newUser)
        } catch {
            throw error
        }
    }
    
    func login() async throws {
        do {
            let userId = try keychainService.get(forKey: credentialKey, inService: serviceKey)
            loggedUser = try await userRepository.retrieveUser(userId: userId)
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
            self.loggedUser = nil
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
