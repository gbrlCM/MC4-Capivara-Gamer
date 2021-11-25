//
//  GameRepositoryProtocol.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

protocol GameRepositoryProtocol {
    func fetchAllGames() async throws -> [Game]
}
