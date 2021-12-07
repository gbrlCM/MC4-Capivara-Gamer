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
    @Published private var recentEvents: [Event]
    var eventRepository: EventRepositoryProtocol
    @Published var searchFieldText: String
    @Published var game: Game
    
    init(eventRepository: EventRepositoryProtocol, user: User) {
        self.user = UserMock.gamerCapibara
        gameEvents = []
        recentEvents = []
        self.eventRepository = eventRepository
        self.searchFieldText = ""
        self.game = GameMock.leagueOfLegends
    }
    
    func fetchGameEvents() async throws {
        gameEvents = try await eventRepository.fetchGameEvents(of: game)
    }
    
    func fetchUserEvents() async throws {
        recentEvents = try await eventRepository.fetchUserEvents(of: user)
    }
    
    func orderEvents() {
        recentEvents.order
    }
}
