//
//  UserRepositoryProtocol.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

protocol UserRepositoryProtocol {
    func login(_ loginData: LoginData) async throws 
    func retrieveUser(userId: String) async throws -> User
    
}
