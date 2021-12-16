//
//  LoginView.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            VStack (alignment: .center) {
                VStack (alignment: .leading){
                    Text("Bem vindo ao Capy!")
                        .font(.title.bold())
                    
                    Text("Encontre, saiba mais sobre e crie seus próprios eventos!")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }.foregroundColor(ColorPalette.primaryText)
                    .padding()
                SignInWAppleButton {
                    viewModel.onLoginCompletion(result: $0)
                }
            }
            Image("Loginbara")
                .resizable()
                .scaledToFit()
        }.backgroundColor(ColorPalette.backgroundColor)
            .alert("Um erro ocorreu ao tentar fazer login.", isPresented: $viewModel.didOccurError) {Button("OK", role: .cancel) { }
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(authenticationService: AutheticationService(repository: UserRepositoryMock(), keychainService: KeychainService()), onFinishAuth: {}))
            .previewDevice("iPhone 13").preferredColorScheme(.light)
    }
}
