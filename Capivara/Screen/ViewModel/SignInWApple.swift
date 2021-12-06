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
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                SignInWithAppleButton(.continue) { request in
                    
                    request.requestedScopes = [.email, .fullName]
            
                }
                                      onCompletion: { result in
                                          
                                          switch result {
                                          case .success(let auth):
                                              
                                              switch auth.credential {
                                              case let credential as ASAuthorizationAppleIDCredential:
                                                  
                                                  //user ID
                                                  let userId = credential.user
                                                  
                                                  //User Infos
                                                  let email = credential.email
                                                  let firstName = credential.fullName?.givenName
                                                  let lastName = credential.fullName?.familyName
                                                  
                                                  self.email = email ?? ""
                                                  self.userId = userId
                                                  self.firstName = firstName ?? ""
                                                  self.lastName = lastName ?? ""
                                                  
                                              default:
                                                  break
                                                
                                              }
                                          case .failure(let error):
                                              print(error)
                                          }
                }
                                      .frame(width: 280, height: 60)
                                      .padding()
                                      .cornerRadius(8)            }
            .navigationTitle("Sign In")
        }

    }
}

struct SignInWApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWApple()
    }
}
