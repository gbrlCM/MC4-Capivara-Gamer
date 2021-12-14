//
//  ExploreScreenViewModel.swift
//  Capivara
//
//  Created by Débora Kassardjian on 07/12/21.
//

import Foundation
import SwiftUI

final class ExploreScreenViewModel: ObservableObject {
    @Published private var gameEvents: [Event]
    @Published var allEvents: [Event]
    private var eventRepository: EventRepositoryProtocol
    private var gameRepository: GameRepositoryProtocol
    @Published var searchFieldText: String
    @Published var games: [Game]
    @Published var event: Event
    @Published var statusView: StatusView = .loading
    
    init(eventRepository: EventRepositoryProtocol, gameRepository: GameRepositoryProtocol) {
        gameEvents = []
        allEvents = []
        self.eventRepository = eventRepository
        self.searchFieldText = ""
        self.games = []
        self.gameRepository = gameRepository
        self.event = EventMock.event
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
        statusView = .loading
        do {
            games = try await gameRepository.fetchAllGames()
            allEvents = try await eventRepository.fetchAllEvents()
            allEvents.sort {
                $0.date < $1.date
            }
            statusView = StatusView.ok
        } catch {
            statusView = StatusView.error
        }
    }
}
