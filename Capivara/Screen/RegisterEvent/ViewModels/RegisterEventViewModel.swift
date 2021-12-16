//
//  RegisterEventViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//
import Combine
import Foundation
import UIKit
import SwiftUI

final class RegisterEventViewModel: ObservableObject {
    
    @Binding
    var isShowing: Bool
    
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
    var coverImage: UIImage?
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
    @Published
    var creator: User
    
    //MARK: Field Validation
    @Published
    var isContactTypeFieldValid: Bool
    @Published
    var isStreamTypeFieldValid: Bool
    
    //MARK: Form Page Validation
    @Published
    var generalFormIsValid: Bool
    
    private var gameRepository: GameRepositoryProtocol
    private var eventRepository: EventRepositoryProtocol
    private var imageUploaderService: ImageUploaderService
    
    init(gameRepository: GameRepositoryProtocol, creator: User, isShowing: Binding <Bool>, eventRepository: EventRepositoryProtocol) {
        self.gameRepository = gameRepository
        self.eventRepository = eventRepository
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
        self.coverImage = nil
        self.isStreamTypeFieldValid = true
        self.isContactTypeFieldValid = true
        self.isIndividual = true
        self.numberOfParticipants = 1
        self.numberOfParticipantsPerTeam = 1
        self.name = ""
        self.description = ""
        self.eventDate = Date()
        self.lobbyEntranceTimer = Date()
        self.eventStartTimer = Date()
        self.generalFormIsValid = false
        self.imageUploaderService = ImageUploaderService()
        self.creator = creator
        self._isShowing = isShowing
    }
    
    private func createEvent (imageURL: String?) -> Event {
        Event(id: nil,
              name: self.name,
              description: self.description,
              game: self.selectedGame ?? GameMock.leagueOfLegends,
              creator: self.creator,
              participants: [],
              coverUrl: imageURL,
              eventType: self.selectedEventType ?? .championship,
              eventFormat: self.selectedTournamentType ?? .points,
              matchFormat: self.selectedMatchType ?? .bestOfOne,
              tournamentCapacity: self.numberOfParticipants,
              teamSize: self.numberOfParticipantsPerTeam,
              date: self.eventDate,
              lobbyEntranceDate: self.lobbyEntranceTimer.timeIntervalSince1970,
              eventStartDate: self.eventStartTimer.timeIntervalSince1970,
              contactType: self.selectedContactType ?? .chatOnly,
              contactLink: self.contactLink,
              streamingType: self.selectedStreamType,
              streamingLink: self.streamLink,
              gamePlatform: self.selectedGameType ?? .pc)
    }
    
    @MainActor
    func fetchAllItems() async {
        do {
            let games = try await gameRepository.fetchAllGames()
            self.games = games
        } catch  {
            viewState = .error
        }
    }
    
    @MainActor
    func finishForm() async throws {
        
        let imageUrl: String?
        
        if let image = coverImage, let jpegData = image.jpegData(compressionQuality: 0.5) {
            imageUrl = try? await imageUploaderService.upload(jpegData)
        }
        
        else {
            imageUrl = nil
        }
        
        let event = createEvent(imageURL: imageUrl)
        try await eventRepository.createEvent(event)
        isShowing = false
        
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
