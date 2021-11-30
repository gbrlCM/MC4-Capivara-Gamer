//
//  UserProfileView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                userIdentificationSection
                    .background(ColorPalette.secondaryBackground)
                    .padding()
                
                navigationSection
                    .padding()
            
                actionsSection
                    .background(ColorPalette.secondaryBackground)
                    .padding()
                
            }
            .backgroundColor(ColorPalette.backgroundColor)
            .navigationTitle("Configurações")
            .navigationBarTitleColor(ColorPalette.primaryText)
            .foregroundColor(ColorPalette.primaryText)
            
            
        }
        .tabBarLabel(text: "CapivaraGamer", systemImage: "person.fill")
    }
    
    @ViewBuilder
    var userIdentificationSection: some View {
        NavigationLink.init(destination: {Text("tela de edição do usuário")}, label: {
            HStack {
                UserProfileAvatar(imageURL: .constant(URL(string: "pudim")))
                VStack(alignment: .leading) {
                    Text("Capivara Gamer")
                        .font(.title2.bold())
                    Text("12/02/2001")

                }

                Spacer()
            } .padding()
                
        })
    }
    
    @ViewBuilder
    var navigationSection: some View {
        NavigationLink(destination: Text("Termos de consetimento")) {
            
            HStack {
                Text("Termos de consentimento")
                Spacer()
            }.padding()
              
        }
    }
    
    @ViewBuilder
    var actionsSection: some View {
        VStack {
            Button {} label: {
                UserProfileActionLabel(text: "Logout")
            }.buttonStyle(.bordered)
            
            Button(role: .destructive) {} label: {
                UserProfileActionLabel(text: "Deletar minha conta")
            }.buttonStyle(.bordered)
            
        }.padding(.all, 16)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
        .preferredColorScheme(.light)
    }
}
