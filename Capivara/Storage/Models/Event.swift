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
    var text: String {
        switch self {
        case .roundRobin:
            return "Round Robin"
        case .singleElimination:
            return "Eliminação Única"
        case .doubleElimination:
            return "Eliminação Dupla"
        case .multiLevel:
            return "Multinível"
        case .extended:
            return "Extendida"
        case .groupStageAndTournament:
            return "Fase de Grupos e Torneio"
        case .points:
            return "Pontos"
        case .singleMatch:
            return "Partida Única"
        }
    }
}

/**
 Format of a match inside a tournament
 cases: Best of One, Best of Three, Best of Five, Best of Seven
 */
enum MatchFormat: String, Codable, CaseIterable {
    case bestOfOne, bestOfThree, bestOfFive, bestOfSeven
    var text: String {
        switch self {
        case .bestOfOne:
            return "Melhor de 1"
        case .bestOfThree:
            return "Melhor de 3"
        case .bestOfFive:
            return "Melhor de 5"
        case .bestOfSeven:
            return "Melhor de 7"
        }
    }
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
    var text: String {
        switch self {
        case .championship:
            return "Campeonato"
        case .training:
            return "Treino"
        case .forFun:
            return "For Fun"
        case .streaming:
            return "Transmitido"
        }
    }
}

enum StreamingType: String, Codable, CaseIterable {
    case twitch, youtube, instagram
}
