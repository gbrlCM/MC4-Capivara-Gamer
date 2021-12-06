//
//  LoginView.swift
//  Capivara
//
//  Created by Thallis Sousa on 03/12/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            VStack (alignment: .center) {
                VStack (alignment: .leading){
                    Text("Bem vindo ao CapivaraGamer!")
                        .font(.title.bold())
                    
                    Text("O aplicativo que te ajuda a encontrar capivaras pro players de COD!")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }.foregroundColor(ColorPalette.primaryText)
                    .padding()
                SignInWApple()
            }
            Image("Loginbara")
                .resizable()
                .scaledToFit()
        }.backgroundColor(ColorPalette.backgroundColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
