//
//  RootView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct RootView: View {
    @State
    var selectedTab: TabBarScreen = .search
    @State
    var isLoggedIn: Bool = true
    @StateObject
    var autheticationService: AutheticationService = AutheticationService(repository: UserRepositoryMock(), keychainService: KeyChainService())
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MyEventsView(viewModel: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara))
                .tag(TabBarScreen.events)
            SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepository(), user: $autheticationService.loggedUser))
                .tag(TabBarScreen.search)
            UserProfileView(viewModel: UserProfileViewModel())
                .tag(TabBarScreen.configuration)
        }
        .task {
            do {
                try await autheticationService.login()
            } catch {
                isLoggedIn = false
            }
        }
        .environmentObject(autheticationService)
        .fullScreenCover(isPresented: $isLoggedIn) {
            LoginView(viewModel:
                        LoginViewModel(authenticationService: autheticationService)
            )
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
