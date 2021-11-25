//
//  Address.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 24/11/21.
//

import Foundation

enum AddressType: String, Codable {
    case online, inPerson
}

struct Address: Codable, Equatable {
    let type: AddressType
    let city: String?
    let code: String?
    let street: String?
    let number: Int?
}
