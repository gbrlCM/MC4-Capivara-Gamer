//
//  UserProfileView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                ScrollView{
                    userIdentificationSection(user: user)
                        .foregroundColor(ColorPalette.primaryText)
                        .background(ColorPalette.secondaryBackground)
                        .cornerRadius(10)
                        .padding()
                    
                    navigationSection
                        .padding()
                    
                    actionsSection
                        .padding()
                }.backgroundColor(ColorPalette.backgroundColor)
                    .navigationTitle("Configurações")
                    .navigationBarTitleColor(ColorPalette.primaryText)
            } else {
                VStack {
                    Spacer()
                    LoadingCircle()
                    Spacer()
                }.backgroundColor(ColorPalette.backgroundColor)
                    .navigationTitle("Configurações")
                    .navigationBarTitleColor(ColorPalette.primaryText)
            }
            
            
            
        }
        .tabBarLabel(text: "CapivaraGamer", systemImage: "person.fill")
    }
    
    @ViewBuilder
    func userIdentificationSection(user: User) -> some View {
        NavigationLink(destination: {
            EditProfileView(viewModel: EditProfileViewModel(user: UserMock.gamerCapibara))
        }, label: {
            HStack {
                UserProfileAvatar(imageURL: user.avatar)
                VStack(alignment: .leading) {
                    Text(user.userName)
                        .font(.title2.bold())
                    Text(user.dateOfBirth, style: .date)
                }
                
                Spacer()
            } .padding()
        })
    }
    
    @ViewBuilder
    var navigationSection: some View {
        NavigationLink(destination: Text("Termos de consentimento")) {
            
            HStack {
                Text("Termos de consentimento")
                    .font(.headline.bold())
                
                Spacer()
            }.padding()
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
            
        }
    }
    
    @ViewBuilder
    var actionsSection: some View {
        VStack {
            Button { viewModel.logout() } label: {
                UserProfileActionLabel(text: "Logout")
                    .font(.headline.bold())
                
            }.buttonStyle(.bordered)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
            
            Button(role: .destructive) { viewModel.delete() } label: {
                UserProfileActionLabel(text: "Deletar minha conta")
                    .font(.headline.bold())
                
            }.buttonStyle(.bordered)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
        }.padding()
            .padding(.horizontal, -15)
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let keychainMock = KeychainServiceMock()
        let service = AutheticationService(repository: UserRepositoryMock(), keychainService: keychainMock)
        UserProfileView(viewModel: UserProfileViewModel(authenticationService: service))
            .task {
                try! keychainMock.set("appleid", forKey: "userCredential", inService: "1243")
                try! await service.login()
            }
            .preferredColorScheme(.light)
    }
}
