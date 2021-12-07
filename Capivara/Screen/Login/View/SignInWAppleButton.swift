//
//  SignInWAppleButton.swift
//  Capivara
//
//  Created by Thallis Sousa on 06/12/21.
//

import SwiftUI
import AuthenticationServices

struct SignInWAppleButton: View {
    var onLoginCompletion: (Result<ASAuthorization, Error>) -> Void
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            onLoginCompletion(result)
        }
        .signInWithAppleButtonStyle(.whiteOutline)
        .frame(width: 300, height: 50)
        .cornerRadius(8)
    }
}

struct SignInWAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWAppleButton{_ in}
    }
}
