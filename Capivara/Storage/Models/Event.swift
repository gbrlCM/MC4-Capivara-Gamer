//
//  Event.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import Foundation

struct Event: Codable, Equatable, Identifiable {
    let id: String?
    var name: String
    var description: String
    var game: Game
    var creator: User
    var coverUrl: String?
    var eventType: EventType
    var eventFormat: TournamentFormat
    var matchFormat: MatchFormat
    var tournamentCapacity: Int
    var creationDate: Date
    var date: Date
    var lobbyEntranceDate: Date
    var eventStartDate: Date
    var address: Address
}

enum TournamentFormat: String, Codable, CaseIterable {
    case roundRobin, singleElimination, doubleElimination, multiLevel, extended, groupStageAndTournament, points
}

enum MatchFormat: String, Codable, CaseIterable {
    case bestOfOne, bestOfThree, bestOfFive, bestOfSeven
}

enum ContactType: String, Codable {
    case discord, email, inGameVoice, chatOnly
}

enum EventType: String, Codable {
    case championship, training, forFun, streaming
}
