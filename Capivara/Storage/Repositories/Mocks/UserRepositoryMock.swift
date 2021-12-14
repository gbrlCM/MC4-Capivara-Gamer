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
         print(user)
         return user
     }

     func retrieveUser(userId: String) async throws -> User {
         if user?.appleId == userId {
             return user!
         } else {
             throw NSError(domain: "No user", code: 1, userInfo: nil)
         }
     }

     func deleteUser(userId: String) async throws {
         user = nil
     }

 }
