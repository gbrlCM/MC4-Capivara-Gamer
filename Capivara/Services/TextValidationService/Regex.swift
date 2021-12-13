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
    case twitch = "(^http(s)?://)?((www|en-es|en-gb|secure|beta|ro|www-origin|en-ca|fr-ca|lt|zh-tw|he|id|ca|mk|lv|ma|tl|hi|ar|bg|vi|th)\\.)?twitch.tv/(?!directory|p|user/legal|admin|login|signup|jobs)(?P<channel>\\w+)"
    case instagram = "/(?:(?:http|https):\\/\\/)?(?:www.)?(?:instagram.com|instagr.am|instagr.com)\\/(\\w+)/igm"
}
