//
//  EventRepositoryProtocol.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

protocol EventRepositoryProtocol {
    func fetchUserEvents(of user: User) async throws -> [Event]
    func fetchAllEvents() async throws -> [Event]
    func fetchGameEvents(of game: Game) async throws -> [Event]
    func createEvent(_ event: Event) async throws
    func registerToEvent(_ user: User, event: Event) async throws
}
