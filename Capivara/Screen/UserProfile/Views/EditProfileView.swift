//
//  EditProfileView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 01/12/21.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    @State private var username: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                UserProfileAvatar(imageURL: $viewModel.user.avatar)
                
                Button(action: {}) {
                    Label("Editar", systemImage: "pencil")
                }
                
                TextField("Username", text: $username)
                    .foregroundColor(ColorPalette.primaryText)
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(ColorPalette.secondaryBackground)
                    .cornerRadius(10)
                    
                HStack {
                    Text("Data de Nascimento")
                        .foregroundColor(ColorPalette.primaryText)
                    Spacer()
                }.padding()
                    
            }.navigationTitle("Editar Perfil")
             .navigationBarTitleDisplayMode(.inline)
             .navigationBarTitleColor(ColorPalette.primaryText)
             .backgroundColor(ColorPalette.backgroundColor)
             
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(viewModel: UserProfileViewModel())
    }
}
