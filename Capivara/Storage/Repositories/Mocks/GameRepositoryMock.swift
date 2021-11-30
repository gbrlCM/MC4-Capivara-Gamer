//
//  GameRepositoryMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import Foundation

@MainActor
class GameRepositoryMock: GameRepositoryProtocol {
    func fetchAllGames() async throws -> [Game] {
        [GameMock.leagueOfLegends]
    }
}
