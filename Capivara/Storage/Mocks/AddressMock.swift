//
//  AddressMock.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import Foundation

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
