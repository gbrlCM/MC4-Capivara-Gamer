//
//  EditProfileViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 10/12/21.
//

import Foundation

final class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var usernameField: String
    
    init(user: User) {
        self.user = user
        self.usernameField = user.username
    }
}
