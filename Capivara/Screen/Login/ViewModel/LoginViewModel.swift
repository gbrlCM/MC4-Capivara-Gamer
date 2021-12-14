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
    private var onFinishAuth: () -> Void
    
    init(authenticationService: AutheticationService, onFinishAuth: @escaping () -> Void){
        self.authenticationService = authenticationService
        self.onFinishAuth = onFinishAuth
        self.didOccurError = false
    }
    
    @MainActor
    func onLoginCompletion(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            onLoginCompletionSucess(auth: auth)
            
        case .failure(_):
            didOccurError = true
        }
    }
    
    @MainActor
    private func onLoginCompletionSucess(auth: ASAuthorization) {
        guard let userCredential = auth.credential as? ASAuthorizationAppleIDCredential else {
            didOccurError = true
            return
        }
        
        Task {
            do {
                try await authenticationService.signIn(credentials: userCredential)
                onFinishAuth()
            } catch {
                print(error.localizedDescription)
                didOccurError = true
            }
        }
    }
    
}




