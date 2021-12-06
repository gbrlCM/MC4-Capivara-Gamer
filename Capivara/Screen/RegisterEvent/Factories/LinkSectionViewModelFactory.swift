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
                             placeholder: "discord.gg/capivaragamer",
                             errorMessage: "Link invalido!",
                             validator: RegexValidator(regex: .discord))
    }
    
    static func buildForEmail() -> LinkSectionViewModel {
        LinkSectionViewModel(title: "Email",
                             subtitle: "Digite aqui o e-mail que jogadores poderão se comunicar com você",
                             placeholder: "capivara@gamer.com",
                             errorMessage: "Email invalido",
                             validator: RegexValidator(regex: .email))
    }
    
    static func buildForYouTube() -> LinkSectionViewModel {
        LinkSectionViewModel(title: "YouTube",
                             subtitle: "Digite aqui o link da sua live no youtube",
                             placeholder: "youtube.com/capivaragamer",
                             errorMessage: "Link invalido!",
                             validator: RegexValidator(regex: .youtube))
    }
    
    static func buildForTwitch() -> LinkSectionViewModel {
        LinkSectionViewModel(title: "Twitch",
                             subtitle: "Digite aqui o link da sua live na twitch",
                             placeholder: "twitch.tv/capivaragamer",
                             errorMessage: "Link invalido!",
                             validator: RegexValidator(regex: .twitch))
    }
}
