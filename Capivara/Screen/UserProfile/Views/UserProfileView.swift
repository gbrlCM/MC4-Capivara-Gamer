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
            VStack {
                userIdentificationSection
                Spacer()
                navigationSection
                Spacer()
                actionsSection
            }
            .backgroundColor(Color(uiColor: .secondarySystemBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{ ToolbarItem(placement: .navigationBarTrailing) { EditButton() }}
        }
        .tabBarLabel(text: "CapivaraGamer", systemImage: "person.fill")
    }
    
    @ViewBuilder
    var userIdentificationSection: some View {
        VStack {
            UserProfileAvatar(imageURL: .constant(URL(string: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png")))
            Text("Capivara Gamer")
                .font(.title.bold())
            Text("12/02/2001")
        }
    }
    
    @ViewBuilder
    var navigationSection: some View {
        List {
            NavigationLink(destination: Text("Termos de consetimento")) {
                Text("Termos de consentimento")
            }.listRowBackground(Color(uiColor: .tertiarySystemBackground))
        }.backgroundColor(.clear)
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
        .preferredColorScheme(.dark)
    }
}
