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
    var isNotLoggedIn: Bool = false
    @StateObject
    var autheticationService: AutheticationService = AutheticationService(repository: UserRepository(), keychainService: KeychainServiceMock())
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MyEventsView(viewModel:
                            MyEventsViewModel(repository: EventRepository(),
                                              user: autheticationService.userPublisher.value,
                                              userPublisher: autheticationService.userPublisher.eraseToAnyPublisher()))
                .tag(TabBarScreen.events)
            SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepository(), gameRepository: GameRepository(), user: autheticationService.userPublisher.value, userPublisher: autheticationService.userPublisher))
                .tag(TabBarScreen.search)
            UserProfileView(viewModel: UserProfileViewModel(authenticationService: autheticationService))
                .tag(TabBarScreen.configuration)
        }
        .task {
            do {
                try await autheticationService.login()
                isNotLoggedIn = false
            } catch {
                print("catch: \(error.localizedDescription)")
                isNotLoggedIn = true
            }
        }
        .environmentObject(autheticationService)
        .fullScreenCover(isPresented: $isNotLoggedIn) {
            LoginView(viewModel:
                        LoginViewModel(authenticationService: autheticationService) {
                isNotLoggedIn = false
            }
            )
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
