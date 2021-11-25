//
//  Address.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 24/11/21.
//

import Foundation

/**
 All the types a Event address can be, if a address is Online all the other Address are nil.
 cases: online, inPerson
 */
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
