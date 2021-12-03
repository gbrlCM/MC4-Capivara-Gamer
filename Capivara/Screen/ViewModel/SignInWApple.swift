//
//  SignInWApple.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI
import AuthenticationServices

struct SignInWApple: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView{
            VStack{
                SignInWithAppleButton(.continue) { request in
            
                }
                                      onCompletion: { result in
                }
                                      .frame(width: 280, height: 60)
                                      .padding()
                                      .cornerRadius(8)
                                      .onTapGesture(perform: showAppleLogin)
            }
            .navigationTitle("Sign In")
        }

    }
    
    private func showAppleLogin() {
      // 1
      let request = ASAuthorizationAppleIDProvider().createRequest()

      // 2
      request.requestedScopes = [.fullName, .email]

      // 3
      let controller = ASAuthorizationController(authorizationRequests: [request])
    }
    
}

struct SignInWApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWApple()
    }
}
