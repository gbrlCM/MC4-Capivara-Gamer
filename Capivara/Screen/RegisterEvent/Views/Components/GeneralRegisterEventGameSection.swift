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
    var selectedID: String?
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Jogo", isMandatory: true) {
            ForEach($games) { $game in
                RegisterEventGameButton(game: $game, selectedID: $selectedID)
                    .onTapGesture {
                        if selectedID == game.id {
                            selectedID = nil
                        } else {
                            selectedID = $game.id
                        }
                    }
                    .padding(.trailing, 8)
            }
        }
    }
}
