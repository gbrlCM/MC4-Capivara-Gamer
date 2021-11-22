//
//  View+TabBarLabel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func tabBarLabel<S: StringProtocol>(text: S, systemImage: String) -> some View {
        self.tabItem {
            Label(text, systemImage: systemImage)
        }
    }
}
