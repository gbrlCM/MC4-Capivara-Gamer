//
 //  UserRepositoryMock.swift
 //  Capivara
 //
 //  Created by Thallis Sousa on 07/12/21.
 //

 import Foundation

 @MainActor
 final class UserRepositoryMock: UserRepositoryProtocol {
     var user: User? = nil

     func login(_ user: User) async throws -> User {
         self.user = user
         self.user?.appleId = "AppleId"
         print(user)
         return self.user!
     }

     func retrieveUser(userId: String) async throws -> User {
         self.user = UserMock.gamerCapibara
         self.user?.appleId = userId
         print(user)
         return self.user!
     }

     func deleteUser(userId: String) async throws {
         user = nil
     }

 }
