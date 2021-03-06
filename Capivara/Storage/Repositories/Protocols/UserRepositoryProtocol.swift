//
//  UserRepositoryProtocol.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

protocol UserRepositoryProtocol {
    func login(_ user: User) async throws -> User
    func retrieveUser(userId: String) async throws -> User
    func deleteUser(userId: String) async throws
}
