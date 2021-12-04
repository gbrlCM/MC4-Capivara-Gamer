//
//  RegisterEventButton.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct RegisterEventButton<P: Presentable>: View {
    var content: P
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            content.label
                .padding()
                .frame(height: 60)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
                .overlay {
                    if isSelected {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).fill(ColorPalette.accent.opacity(0.3))
                            RoundedRectangle(cornerRadius: 8).stroke(ColorPalette.accent, lineWidth: 2.5)
                        }
                    }
                }
                .animation(.easeInOut.speed(2), value: isSelected)
        }
    }
}

struct RegisterEventButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterEventButton(content: TournamentFormat.doubleElimination, isSelected: true) {}
                .padding()
                .previewLayout(.sizeThatFits)
            .previewInterfaceOrientation(.landscapeLeft)
            RegisterEventButton(content: GameType.xbox, isSelected: true) {}
                .padding()
                .previewLayout(.sizeThatFits)
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
