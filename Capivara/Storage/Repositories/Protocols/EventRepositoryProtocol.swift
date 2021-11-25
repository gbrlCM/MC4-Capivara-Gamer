//
//  EventRepositoryProtocol.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

protocol EventRepositoryProtocol: Actor {
    func fetchUserEvents(of user: User) async throws -> [Event]
    func fetchHotEvents() async throws -> [Event]
    func fetchGameEvents(of game: Game) async throws -> [Event]
    func fetchEventByType(_ format: EventType) async throws -> [Event]
    func createEvent(_ event: Event) async throws
    func registerToEvent(_ user: User, event: Event) async throws
}
