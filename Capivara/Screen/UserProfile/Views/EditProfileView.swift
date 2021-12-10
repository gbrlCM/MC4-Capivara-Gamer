//
//  EditProfileView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 01/12/21.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    var body: some View {
        
        VStack() {
            userPhotoChanger
                            
            userNameChanger
                .padding()
            
            userDateChangerLabel
            
            userDateChanger
                .padding(.horizontal)
               
            
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
            TextField("Username", text: $viewModel.usernameField)
                .padding()
                .foregroundColor(ColorPalette.primaryText)
                .frame(width: 360, height: 40, alignment: .center)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
                .colorScheme(.dark)
                            
        }
    }
    
    @ViewBuilder
    var userDateChangerLabel: some View {
        HStack() {
            Text("Data de Nascimento")
                .foregroundColor(ColorPalette.primaryText)
            Spacer()
        }.padding()
    }
    
    @ViewBuilder
    var userDateChanger: some View {
        HStack{
        DatePicker("", selection: $viewModel.user.dateOfBirth, displayedComponents: .date)
            .labelsHidden()
            .colorScheme(.dark)
            .accentColor(ColorPalette.accent)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(ColorPalette.secondaryBackground)
                        .opacity(2.0))
                    .datePickerStyle(GraphicalDatePickerStyle())
        }
            
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(viewModel: EditProfileViewModel(user: UserMock.gamerCapibara))
        }
    }
}


