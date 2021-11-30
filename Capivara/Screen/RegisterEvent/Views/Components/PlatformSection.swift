//
//  PlatformSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct PlatformSection: View {
    var platforms: [GameType] = GameType.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Plataforma", isMandatory: true) {
            ForEach(platforms, id: \.self) { platform in
                RegisterEventButton(content: platform, isSelected: false).padding(.trailing, 8)
            }
        }
    }
}
