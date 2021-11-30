//
//  LoadingCircle.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 27/11/21.
//

import SwiftUI

struct LoadingCircle: View {
    @State
    var shouldAnimate = false
    
    var body: some View {
        Circle()
            .fill(ColorPalette.accent)
            .frame(height: 30)
            .overlay (
                ZStack {
                    ForEach([1, 1.5, 2], id: \.self) { scale in
                        Circle()
                            .stroke(ColorPalette.accent, lineWidth: 100)
                            .scaleEffect(shouldAnimate ? scale : 0)
                    }
                }.opacity(shouldAnimate ? 0 : 0.2)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: shouldAnimate)
            )
            .onAppear {
                self.shouldAnimate = true
            }
    }
}
