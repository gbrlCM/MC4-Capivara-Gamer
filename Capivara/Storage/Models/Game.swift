//
//  Game.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 24/11/21.
//

import Foundation

struct Game: Codable, Equatable, Identifiable {
    let id: String
    let name: String
    let teamCapacity: Int
    let icon: String
    let cover: String
}

enum GameType: String, Codable, CaseIterable {
    case mobile, pc, xbox, playstation
}
