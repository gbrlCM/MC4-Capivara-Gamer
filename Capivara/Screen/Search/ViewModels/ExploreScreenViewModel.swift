//
//  ExploreScreenViewModel.swift
//  Capivara
//
//  Created by Débora Kassardjian on 07/12/21.
//

import Foundation

final class ExploreScreenViewModel: ObservableObject {
    @Published var user: User
    @Published private var gameEvents: [Event]
    @Published var allEvents: [Event]
    private var eventRepository: EventRepositoryProtocol
    private var gameRepository: GameRepositoryProtocol
    @Published var searchFieldText: String
    @Published var games: [Game]
    @Published var statusView: StatusView = .loading
    
    init(eventRepository: EventRepositoryProtocol, gameRepository: GameRepositoryProtocol, user: User) {
        self.user = user
        gameEvents = []
        allEvents = []
        self.eventRepository = eventRepository
        self.searchFieldText = ""
        self.games = []
        self.gameRepository = gameRepository
    }
    
    var searchedEvents: [Event] {
        if searchFieldText.isEmpty {
            return allEvents
        } else {
            return allEvents.filter{
                $0.name.contains(searchFieldText)
            }
        }
    }

    @MainActor
    func fetchInitialData() async {
        do {
            games = try await gameRepository.fetchAllGames()
            allEvents = try await eventRepository.fetchAllEvents()
            statusView = StatusView.ok
        } catch {
            fatalError(error.localizedDescription)
            statusView = StatusView.error
        }
    }
    
    func orderEvents() {
        
    }
}
