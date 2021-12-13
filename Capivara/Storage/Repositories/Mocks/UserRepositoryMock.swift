//
 //  UserRepositoryMock.swift
 //  Capivara
 //
 //  Created by Thallis Sousa on 07/12/21.
 //

 import Foundation

 @MainActor
 final class UserRepositoryMock: UserRepositoryProtocol {
     var user: User = UserMock.gamerCapibara

     func login(_ user: User) async throws {
         self.user.username = user.username
         print(user)
     }

     func retrieveUser(userId: String) async throws -> User {
         print(userId)
         return user
     }

     func deleteUser(userId: String) async throws {
         print(userId)
     }

 }
