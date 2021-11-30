//
//  RegisterEventTab.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import Foundation

enum RegisterEventTab: Int, Hashable {
    case general, game, rules
    
    var title: String {
        switch self {
        case .general:
            return "Geral"
        case .game:
            return "Jogo"
        case .rules:
            return "Regras"
        }
    }
}
