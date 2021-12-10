//
//  GeneralRegisterEventGameSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct GeneralRegisterEventGameSection: View {
    @Binding
    var games: [Game]
    @Binding
    var selectedGame: Game?
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Jogo", isMandatory: true) {
            ForEach($games) { $game in
                RegisterEventGameButton(game: $game, isSelected: selectedGame == game)
                    .onTapGesture {
                        if selectedGame == game {
                            selectedGame = nil
                        } else {
                            selectedGame = game
                        }
                    }
                    .padding(.trailing, 8)
            }
        }
    }
}
