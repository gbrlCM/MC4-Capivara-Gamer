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
              coverUrl: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png",
              eventType: .championship,
              eventFormat: .roundRobin,
              matchFormat: .bestOfOne,
              tournamentCapacity: 8,
              creationDate: Date(timeIntervalSince1970: 1024),
              date: Date(timeIntervalSince1970: 3096),
              lobbyEntranceDate: Date(timeIntervalSince1970: 4004),
              eventStartDate: Date(timeIntervalSince1970: 4060),
              address: AddressMock.onlineAddress)
    }
    
    static var events: [Event] {
        let baseEvent = EventMock.event
        
        var events = Array(repeating: baseEvent, count: 15)
        
        events = events.enumerated().map { (iterator, element) in
            var modElement = element
            modElement.name = "Capivara Gamer \(iterator)"
            modElement.description = "Descrição da Capivara gamer \(iterator)"
            modElement.coverUrl = Bool.random() == true ? "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png" : nil
            
            return modElement
        }
        
        return events
    }
}

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

enum UserMock {
    static var gamerCapibara: User {
        User(id: UUID().uuidString,
             username: "capivaraGamer",
             avatar: "oi",
             description: "eu sou uma capivara e eu sou gamer",
             dateOfBirth: Date())
    }
}

enum AddressMock {
    static var onlineAddress: Address {
        Address(type: .online,
                city: nil,
                code: nil,
                street: nil,
                number: nil)
    }
    
    static var inPersonAddress: Address {
        Address(type: .inPerson,
                city: "Cajazeiras City",
                code: "0146010",
                street: "Rua dos bobos",
                number: 0)
    }
}
