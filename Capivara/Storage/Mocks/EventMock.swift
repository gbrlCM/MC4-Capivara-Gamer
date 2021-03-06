//
//  EventMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 24/11/21.
//

import Foundation

enum EventMock {
    static var event: Event {
        Event(id: UUID().uuidString,
              name: "Venha jogar com a Capivara",
              description: "Capivara gamer é o gamer mais shanty que existe, ele te dará uma quantidade gigantesta de premios. e conhecerá a coisa mais fofa que existe.",
              game: GameMock.leagueOfLegends,
              creator: UserMock.gamerCapibara,
              participants: [],
              coverUrl: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png",
              eventType: .championship,
              eventFormat: .roundRobin,
              matchFormat: .bestOfOne,
              tournamentCapacity: 8,
              teamSize: 5,
              date: Date(timeIntervalSince1970: 4096),

              lobbyEntranceDate: Date(timeIntervalSince1970: 4004).timeIntervalSince1970,
              eventStartDate: Date(timeIntervalSince1970: 4060).timeIntervalSince1970,
              contactType: .chatOnly,
              contactLink: "mailto:nathaliapapst@gmail.com".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              streamingType: .instagram,
              streamingLink: "https://www.twitch.tv",
              gamePlatform: .mobile
        )
    }
    
    static var events: [Event] {
        
        let events = [EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event, EventMock.event]
        
        let newEvents = events.enumerated().map { (iterator, element) -> Event in
            var modElement = element
            modElement.name = "Capivara Gamer \(iterator)"
            modElement.description = "Descrição da Capivara gamer \(iterator)"
            modElement.coverUrl = Bool.random() == true ? "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png" : nil
            
            return modElement
        }
        
        return newEvents
    }
}
