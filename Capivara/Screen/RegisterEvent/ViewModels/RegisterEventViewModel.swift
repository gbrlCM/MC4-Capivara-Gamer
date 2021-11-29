//
//  RegisterEventViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import Foundation

@MainActor
final class RegisterEventViewModel: ObservableObject {
    
    @Published
    var selectedTab: RegisterEventTab = .general
    @Published
    var games: [Game]
    @Published
    var viewState: RegisterEventViewState
    
    private var repository: GameRepositoryProtocol
    
    init(repository: GameRepositoryProtocol) {
        self.repository = repository
        self.games = []
        self.viewState = .loading
    }
    
    func fetchAllItems() async {
        do {
            let games = try await repository.fetchAllGames()
            self.games = games
        } catch  {
            viewState = .error
        }
    }
    
    enum RegisterEventViewState {
        case loading, loaded, error
    }
}
