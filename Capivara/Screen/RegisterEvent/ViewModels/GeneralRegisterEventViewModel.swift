//
//  GeneralRegisterEventViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 27/11/21.
//

import Foundation
import SwiftUI

final class GeneralRegisterEventViewModel: ObservableObject {
    
    @Binding
    var games: [Game]
    @Published
    var selectedID: String?
    
    init(games: Binding<[Game]>) {
        self._games = games
        selectedID = nil
    }
}
