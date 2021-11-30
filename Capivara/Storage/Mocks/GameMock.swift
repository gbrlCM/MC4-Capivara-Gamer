//
//  GameMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

enum GameMock {
    static var leagueOfLegends: Game {
        Game(name: "League of Legends",
             types: [.pc],
             teamCapacity: 5,
             formats: TournamentFormat.allCases,
             icon: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/lolIcon.png",
             cover: "")
    }
}
