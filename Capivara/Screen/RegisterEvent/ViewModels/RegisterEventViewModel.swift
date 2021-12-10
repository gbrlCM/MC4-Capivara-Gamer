//
//  RegisterEventViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//
import Combine
import Foundation

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
    var selectedTournamentType: TournamentFormat?
    @Published
    var selectedMatchType: MatchFormat?
    @Published
    var contactLink: String
    @Published
    var streamLink: String
    @Published
    var hasStreaming: Bool
    @Published
    var isIndividual: Bool
    @Published
    var numberOfParticipants: Int
    @Published
    var numberOfParticipantsPerTeam: Int
    @Published
    var name: String
    @Published
    var description: String
    @Published
    var eventDate: Date
    @Published
    var lobbyEntranceTimer: Date
    @Published
    var eventStartTimer: Date
    
    //MARK: Field Validation
    @Published
    var isContactTypeFieldValid: Bool
    @Published
    var isStreamTypeFieldValid: Bool
    
    //MARK: Form Page Validation
    @Published
    var generalFormIsValid: Bool
    
    private var repository: GameRepositoryProtocol
    
    init(repository: GameRepositoryProtocol) {
        self.repository = repository
        self.games = []
        self.viewState = .loading
        self.selectedGame = nil
        self.selectedGameType = nil
        self.selectedContactType = nil
        self.selectedEventType = nil
        self.selectedTournamentType = nil
        self.selectedMatchType = nil
        self.selectedStreamType = nil
        self.contactLink = ""
        self.streamLink = ""
        self.hasStreaming = false
        self.isStreamTypeFieldValid = true
        self.isContactTypeFieldValid = true
        self.isIndividual = true
        self.numberOfParticipants = 1
        self.numberOfParticipantsPerTeam = 1
        self.name = ""
        self.description = ""
        self.eventDate = Date()
        self.lobbyEntranceTimer = Date().addingTimeInterval(3600)
        self.eventStartTimer = Date().addingTimeInterval(3600*2)
        self.generalFormIsValid = false
    }
    
    func fetchAllItems() async {
        do {
            let games = try await repository.fetchAllGames()
            self.games = games
        } catch  {
            viewState = .error
        }
    }
    
    var isGeneralFormDisabled: Bool {
        if name.isEmpty
            && description.isEmpty
            && eventDate < Date()
            && lobbyEntranceTimer > eventDate
            && eventStartTimer > eventDate {
            return true
        } else {
            return false
        }
    }
    
    enum RegisterEventViewState {
        case loading, loaded, error
    }
}
