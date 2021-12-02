//
//  PlatformSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct PlatformSection: View {
    @Binding
    var selectedPlatform: GameType?
    
    var platforms: [GameType] = GameType.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Plataforma", isMandatory: true) {
            ForEach(platforms, id: \.self) { platform in
                RegisterEventButton(content: platform, isSelected: isSelected(platform: platform)).padding(.trailing, 8)
                    .onTapGesture {
                        if selectedPlatform == platform {
                            selectedPlatform = nil
                        } else {
                            selectedPlatform = platform
                        }
                    }
            }
        }
    }
    
    func isSelected(platform: GameType) -> Bool {
        selectedPlatform == platform
    }
    
}
