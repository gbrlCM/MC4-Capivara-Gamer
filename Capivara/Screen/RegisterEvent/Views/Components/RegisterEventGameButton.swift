//
//  RegisterEventGameButton.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 27/11/21.
//

import SwiftUI

struct RegisterEventGameButton: View {
    @Binding
    var game: Game
    @Binding
    var selectedID: String?
    
    var body: some View {
        CapybaraAsyncImage(url: URL(string: game.cover))
            .overlay {
                if let selectedID = selectedID, selectedID == game.id {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(ColorPalette.accent.opacity(0.35))
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(ColorPalette.accent, lineWidth: 4)
                    }
                }
            }
            .cornerRadius(10)
            .clipped()
            .frame(width: 160, height: 160)
    }
}

struct RegisterEventGameButtom_PreviewProvider: PreviewProvider {
    static var previews: some View {
        let game = GameMock.leagueOfLegends
        RegisterEventGameButton(game: .constant(game), selectedID: .constant(game.id))
            .previewLayout(.sizeThatFits)
    }
}
