//
//  Regex.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 03/12/21.
//

import Foundation

enum Regex: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case discord = "(https:\\/\\/)?(www\\.)?(((discord(app)?)?\\.com\\/invite)|((discord(app)?)?\\.gg))\\/(?<invite>.+)"
    case youtube = "^((?:https?:)?\\/\\/)?((?:www|m)\\.)?((?:youtube\\.com|youtu.be))(\\/(?:[\\w\\-]+\\?v=|embed\\/|v\\/)?)([\\w\\-]+)(\\S+)?$"
}
