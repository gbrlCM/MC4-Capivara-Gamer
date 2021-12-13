//
//  PopularGames.swift
//  Capivara
//
//  Created by Débora Kassardjian on 07/12/21.
//

import Foundation
import SwiftUI

struct PopularGame: View {
    var game: Game
    
    var body: some View {
        VStack {
            CapybaraAsyncImage(url: URL(string: game.cover))
                .clipShape(Circle())
                .frame(height: 100, alignment: .center)
            Text(game.name)
                .foregroundColor(ColorPalette.primaryText)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
        }.frame(width: 100)
    }
}
