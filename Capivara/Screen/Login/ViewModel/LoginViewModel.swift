//
//  SignInWApple.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI
import AuthenticationServices

final class LoginViewModel: ObservableObject {
    
    @Published var didOccurError: Bool
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol){
        self.repository = repository
        self.didOccurError = false
    }
    
    func onLoginCompletion(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            onLoginCompletionSucess(auth: auth)
            
        case .failure(_):
            didOccurError = true
        }
    }
    
    private func onLoginCompletionSucess(auth: ASAuthorization) {
        guard let userCredential = auth.credential as? ASAuthorizationAppleIDCredential else {
            didOccurError = true
            return}
        
        let userId = userCredential.user
        let firstName = userCredential.fullName?.givenName
        let lastName = userCredential.fullName?.familyName
        let fullName = "\(firstName ?? "") \(lastName ?? "")"
        let loginData = LoginData(appleId: userId, username: fullName)
        
//        Task {
//            do {
//                try await repository.login(loginData)
//                let user = try await repository.retrieveUser(userId: "")
//                print(user)
//            } catch {
//                didOccurError = true
//            }
//        }
    }
    
}




