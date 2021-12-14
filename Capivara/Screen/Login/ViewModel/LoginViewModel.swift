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
    private var authenticationService: AutheticationService
    
    init(authenticationService: AutheticationService){
        self.authenticationService = authenticationService
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
            return
        }
        
        Task {
            do {
                try await authenticationService.signIn(credentials: userCredential)
            } catch {
                print(error.localizedDescription)
                didOccurError = true
            }
        }
    }
    
}




