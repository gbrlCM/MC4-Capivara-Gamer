//
//  UserProfileViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 01/12/21.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    @Published var user: User
    
    init() {
        self.user = UserMock.gamerCapibara
    }
    
    func logout() {
        
    }
    
    func delete() {
        
    }
}
