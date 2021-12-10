//
//  Validator.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import Foundation

protocol Validator {
    func validate(text: String) -> Bool
}
