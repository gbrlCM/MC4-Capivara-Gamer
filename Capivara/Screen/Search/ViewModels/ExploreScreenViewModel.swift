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
    
    init(eventRepository: EventRepositoryProtocol, gameRepository: GameRepositoryProtocol, user: User) {
        self.user = user
        gameEvents = []
        allEvents = []
        self.eventRepository = eventRepository
        self.searchFieldText = ""
        self.games = []
        self.gameRepository = gameRepository
    }
    
    func fetchInitialData() async {
        do {
            games = try await gameRepository.fetchAllGames()
            allEvents = try await eventRepository.fetchAllEvents()
        } catch {
            // Implementar algo para demonstrar erro
        }
    }
    
    func orderEvents() {
        
    }
}
