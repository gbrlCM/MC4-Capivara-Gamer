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
             userName: "capivaraGamer",
             avatar: "https://image-downloader-test.s3.sa-east-1.amazonaws.com/sharkibara.png",
             dateOfBirth: Date(timeIntervalSince1970: 350000000),
             appleId: "AppleId"
        )
    }
}
