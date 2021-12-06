//
//  RegisterEventViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import Foundation

@MainActor
final class RegisterEventViewModel: ObservableObject {
    
    //MARK: View States
    @Published
    var selectedTab: RegisterEventTab = .general
    @Published
    var viewState: RegisterEventViewState
    
    //MARK: Form Bindings
    @Published
    var games: [Game]
    @Published
    var selectedGame: Game?
    @Published
    var selectedGameType: GameType?
    @Published
    var selectedEventType: EventType?
    @Published
    var selectedContactType: ContactType?
    @Published
    var selectedStreamType: StreamingType?
    @Published
    var contactLink: String
    @Published
    var streamLink: String
    @Published
    var hasStreaming: Bool
    
    //MARK: Field Validation
    @Published
    var isContactTypeFieldValid: Bool
    @Published
    var isStreamTypeFieldValid: Bool
    
    private var repository: GameRepositoryProtocol
    
    init(repository: GameRepositoryProtocol) {
        self.repository = repository
        self.games = []
        self.viewState = .loading
        self.selectedGame = nil
        self.selectedGameType = nil
        self.selectedContactType = nil
        self.selectedEventType = nil
        self.selectedStreamType = nil
        self.contactLink = ""
        self.streamLink = ""
        self.hasStreaming = false
        self.isStreamTypeFieldValid = true
        self.isContactTypeFieldValid = true
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
