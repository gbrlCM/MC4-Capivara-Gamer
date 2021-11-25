//
//  User.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 24/11/21.
//

import Foundation

struct User: Codable, Equatable, Identifiable {
    let id: String
    var username: String
    var avatar: String
    var description: String
    var dateOfBirth: Date
}
