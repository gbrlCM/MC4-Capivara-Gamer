//
//  SignInWApple.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI
import AuthenticationServices
///
struct SignInWApple: View {
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            
            switch result {
            case .success(let auth):
                
                switch auth.credential {
                case let Credential as ASAuthorizationAppleIDCredential:
                    
                    let userId = Credential.user
                    let email = Credential.email
                    let firstName = Credential.fullName?.givenName
                    let lastName = Credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.userId = userId
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    
                    print(userId)
                    
                default:
                    break
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        .signInWithAppleButtonStyle(.whiteOutline)
        .frame(width: 300, height: 50)
        .padding()
        .cornerRadius(8)
    }
}

struct SignInWApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWApple()
    }
}
