//
//  LinkSectionViewModel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 03/12/21.
//

import Foundation

enum LinkSectionViewModelFactory {
    
    static func buildForDiscord() -> LinkSectionViewModel {
        LinkSectionViewModel(title: "Link do Discord",
                             subtitle: "Adicionoe o link do discord que será usado no evento.",
                             placeholder: "discord.gg/link",
                             errorMessage: "Link invalido!",
                             validator: DiscordValidator())
    }
    
    static func buildForEmail() -> LinkSectionViewModel {
        LinkSectionViewModel(title: "Email",
                             subtitle: "Digite aqui o e-mail que jogadores poderão se comunicar com você",
                             placeholder: "capivara@gamer.com",
                             errorMessage: "Email invalido",
                             validator: EmailValidator())
    }
}
