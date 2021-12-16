//
//  UserProfileViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 01/12/21.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    private let authenticationService: AutheticationService
    init(authenticationService: AutheticationService) {
        self.user = authenticationService.userPublisher.value
        self.authenticationService = authenticationService
        authenticationService.userPublisher.receive(on: RunLoop.main).assign(to: &$user)
    }
    
    @MainActor
    func logout() {
        Task {
            do {
                try authenticationService.logout()
            } catch {
                
            }
        }
    }
    
    @MainActor
    func delete() {
        Task {
            do {
                try await authenticationService.deleteAccount()
            } catch {
                
            }
        }
    }
}
