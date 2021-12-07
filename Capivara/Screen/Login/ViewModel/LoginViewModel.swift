//
//  SignInWApple.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI
import AuthenticationServices

final class LoginViewModel: ObservableObject {
    @AppStorage("id") var userId: String = ""
    
    @Published var didOccurError: Bool
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol){
        self.repository = repository
        self.didOccurError = false
    }
    
    func loginUser(id: String, username: String, dateOfBirth: Date) -> User{
        let user = User(id: id, username: username, avatar: "", description: "", dateOfBirth: dateOfBirth)
        userId = user.id
        return user
    }
    
    func checkIfIsLogged() {
        let id = userId
        if id != "" {
            print("Seja bem vindo novamente, Capi")
            //se estiver logado, é aqui
        } else {
            //caso não esteja logado, é aqui
        }
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
        
        Task {
            do {
                try await repository.login(loginData)
                let user = try await repository.retrieveUser(userId: "")
                print(user)
            } catch {
                didOccurError = true
            }
        }
    }
    
}




