//
//  EventRepository.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

actor EventRepository: EventRepositoryProtocol {
    func fetchUserEvents(of user: User) async throws -> [Event] {
        let events = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/event/user/\(user.id ?? "nil")", decodeTo: [Event].self)
        return events
    }
    
    func fetchAllEvents() async throws -> [Event] {
        
        let events = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/event", decodeTo: [Event].self)
        return events
    }
    
    func fetchGameEvents(of game: Game) async throws -> [Event] {
        let events = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/event/game/\(String(describing: game.id.self))", decodeTo: [Event].self)
        return events
    }
    
    func fetchEventByType(_ format: EventType) async throws -> [Event] {
        let events = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/event/type/\(format)", decodeTo: [Event].self)
        return events
    }
    
    func createEvent(_ event: Event) async throws {
        try await URLSession.shared.post(urlString: "https://capivara-back.herokuapp.com/event/create", body: event)
        
    }
    
    func registerToEvent(_ user: User, event: Event) async throws {

        try await URLSession.shared.post(urlString: "https://capivara-back.herokuapp.com/event/\(event.id ?? "nil")/addparticipant", body: user)
        
    }
    
    
}


