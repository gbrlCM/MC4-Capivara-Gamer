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

     func login(_ loginData: LoginData) async throws {
         user.username = loginData.username
     }

     func retrieveUser(userId: String) async throws -> User {
         return user
     }


 }
