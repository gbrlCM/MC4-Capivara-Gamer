//
//  DiscordLinkSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import SwiftUI

struct DiscordLinkSection: View {
    @Binding
    var discordLinkContent: String
    @Binding
    var isValid: Bool
    
    let viewModel: LinkSectionViewModel = .init(title: "Link do Discord",
                                                subtitle: "Adicionoe o link do discord que será usado no evento.",
                                                placeholder: "discord.gg/link",
                                                errorMessage: "Link invalido!")
    
    var body: some View {
        LinkSection(linkContent: $discordLinkContent,
                    isValid: $isValid,
                    viewModel: viewModel)
    }
}

struct DiscordLinkSection_Previews: PreviewProvider {
    
    static var previews: some View {
        DiscordLinkSection(discordLinkContent: .constant(""), isValid: .constant(false))
            .padding().padding()
            .background(ColorPalette.backgroundColor)
            .previewLayout(.sizeThatFits)
    }
}
