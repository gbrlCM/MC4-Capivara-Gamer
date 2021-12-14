//
//  EventRepository.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

actor EventRepository: EventRepositoryProtocol {
    func fetchUserEvents(of user: User) async throws -> [Event] {
//        guard let url = URL(string: "https://capivara-back.herokuapp.com/event/user/\(String(describing: user.id))") // Mostra o caminho do back
//        else {
//            throw NSError(domain: "Unvalid URL", code: 1, userInfo: nil)
//        }
//
//        let request = URLRequest(url: url) // Cria uma requisição com o caminho do back
//        let (data, _) = try await URLSession.shared.data(for: request) // Executa a requisição e conecta com o back
//        let decodedData = try JSONDecoder().decode([Event].self, from: data) // Decodifica o JSON para os tipos dentro do Swift
//
//        return decodedData
        let events = try await URLSession.shared.get(urlString: "https://capivara-back.herokuapp.com/event/user/\(String(describing: user.id))", decodeTo: [Event].self)
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

        try await URLSession.shared.post(urlString: "https://capivara-back.herokuapp.com/event/\(String(describing: event.id))/addparticipant", body: user)
        
    }
    
    
}


