//
//  EventRepositoryMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

@MainActor
class EventRepositoryMock: EventRepositoryProtocol {
    var allEvents = EventMock.events
    
    func fetchUserEvents(of user: User) async throws -> [Event] {
        allEvents[3].creator = user
        
        return allEvents 
    }
    
    func fetchAllEvents() async throws -> [Event] {
        allEvents
    }
    
    func fetchGameEvents(of game: Game) async throws -> [Event] {
        let mapped = allEvents
            .enumerated()
            .filter { (offset, element) in offset < 5 }
            .map { (offset, element) -> Event in
                var newElement = element
                newElement.game = game
                return newElement
            }
        
        return mapped
    }
    
    func fetchEventByType(_ format: EventType) async throws -> [Event] {
        let mapped = allEvents
            .enumerated()
            .filter { (offset, element) in offset < 5 }
            .map { (offset, element) -> Event in
                var newElement = element
                newElement.eventType = format
                return newElement
            }
        
        return mapped
    }
    
    func createEvent(_ event: Event) async throws {
        allEvents.append(event)
    }
    
    func registerToEvent(_ user: User, event: Event) async throws {
        guard let index = allEvents.firstIndex(of: event) else {
            throw NSError(domain: "Event not found", code: 404, userInfo: nil)
        }
        allEvents[index].participants.append(user)
    }
}
