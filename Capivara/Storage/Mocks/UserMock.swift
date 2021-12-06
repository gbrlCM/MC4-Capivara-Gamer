//
//  UserMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

enum UserMock {
    static var gamerCapibara: User {
        User(id: UUID().uuidString,
             username: "capivaraGamer",
             avatar: "oi",
             description: "eu sou uma capivara e eu sou gamer",
             dateOfBirth: Date())
    }
}
