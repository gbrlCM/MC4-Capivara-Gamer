//
//  DiscordValidator.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import Foundation

struct DiscordValidator: Validator {
    private let regex = "(https:\\/\\/)?(www\\.)?(((discord(app)?)?\\.com\\/invite)|((discord(app)?)?\\.gg))\\/(?<invite>.+)"
    
    func validate(text: String) -> Bool {
        let discordPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return discordPredicate.evaluate(with: text)
        
        //return text == "oi"
    }
}
