//
//  GameMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

enum GameMock {
    static var leagueOfLegends: Game {
        Game(id: UUID().uuidString,
             name: "League of Legends",
             teamCapacity: 5,
             icon: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/lolIcon.png",
             cover: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png")
    }
}
