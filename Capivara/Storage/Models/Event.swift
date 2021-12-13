//
//  Event.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import Foundation
import SwiftUI

struct Event: Codable, Equatable, Identifiable {
    let id: String?
    var name: String
    var description: String
    var game: Game
    var creator: User
    var participants: [User]
    var coverUrl: String?
    var eventType: EventType
    var eventFormat: TournamentFormat
    var matchFormat: MatchFormat
    var tournamentCapacity: Int
    var teamSize: Int
    var creationDate: Date
    var date: Date
    var lobbyEntranceDate: Date
    var eventStartDate: Date
    var address: Address
    var contactType: ContactType
    var contactLink: String?
    var streamingType: StreamingType?
    var streamingLink: String?
    var gamePlatform: GameType
}

/**
 Possible formats of a tournament
 cases: Round Robin, Single Elimination, Double Elimination, Multiple Levels, extended, Group Stage And Tournament, Points and Single Match
 */
enum TournamentFormat: String, Codable, CaseIterable {
    case roundRobin, singleElimination, doubleElimination, multiLevel, extended, groupStageAndTournament, points, singleMatch
}

/**
 Format of a match inside a tournament
 cases: Best of One, Best of Three, Best of Five, Best of Seven
 */
enum MatchFormat: String, Codable, CaseIterable {
    case bestOfOne, bestOfThree, bestOfFive, bestOfSeven
}

/**
 Type of contact of a event, ergo how you can enter in contact with the owner of the event
 cases: discord, email, inGameVoice, chatOnly
 */
enum ContactType: String, Codable, CaseIterable {
    case discord, email, inGameVoice, chatOnly
}

/**
 All the types a event can be
 cases: championship, training, for fun adn streaming
 */
enum EventType: String, Codable, CaseIterable {
    case championship, training, forFun, streaming
}

enum StreamingType: String, Codable, CaseIterable {
    case twitch, youtube, instagram
}
