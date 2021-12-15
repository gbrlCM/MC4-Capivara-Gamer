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
    var coverImage: UIImage
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
    
    private var repository: GameRepositoryProtocol
    private var imageUploaderService: ImageUploaderService
    
    init(repository: GameRepositoryProtocol, creator: User, isShowing: Binding <Bool>) {
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
        self.coverImage = UIImage()
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
    
    @MainActor
    func fetchAllItems() async {
        do {
            let games = try await repository.fetchAllGames()
            self.games = games
        } catch  {
            viewState = .error
        }
    }
    
    @MainActor
    func finishForm() async {
        if let jpegData = coverImage.jpegData(compressionQuality: 0.5) {
            do {
                let imageURL = try await imageUploaderService.upload(jpegData)
                print(imageURL)
                
                let newEvent: Event = Event(id: nil,
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
                
                isShowing = false
            } catch {
                fatalError()
            }
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
