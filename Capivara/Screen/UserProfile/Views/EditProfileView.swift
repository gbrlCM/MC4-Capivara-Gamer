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
        
        VStack() {
            userPhotoChanger
                            
            userNameChanger
                .padding()
            
            userDateChanger
                
               
            
            Spacer()
            
        }.navigationTitle("Editar Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleColor(ColorPalette.primaryText)
            .backgroundColor(ColorPalette.backgroundColor)
        
    }
    
    @ViewBuilder
    var userPhotoChanger: some View {
        VStack {
            UserProfileAvatar(imageURL: $viewModel.user.avatar)
            
            Button(action: {}) {
                Label("Editar", systemImage: "pencil")
            }
        }
    }
    
    @ViewBuilder
    var userNameChanger: some View {
        VStack {
            TextField("Username", text: $username)
                .foregroundColor(ColorPalette.primaryText)
                .frame(width: 350, height: 40, alignment: .center)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
        }
    }
    
    @ViewBuilder
    var userDateChanger: some View {
        HStack() {
            Text("Data de Nascimento")
                .foregroundColor(ColorPalette.primaryText)
            Spacer()
        }.padding()
        
        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("") })
            .labelsHidden()
            
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(viewModel: UserProfileViewModel())
        }
    }
}


