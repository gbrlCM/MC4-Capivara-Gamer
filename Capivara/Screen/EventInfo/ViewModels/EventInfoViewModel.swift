//
//  EventInfoViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 06/12/21.
//

import Foundation

final class EventInfoViewModel: ObservableObject {
    @Published var event: Event
    var streamLinkImage: (String, URL)? {
        guard let streamType = event.streamingType,
              let streamLink = event.streamingLink,
              let streamURL = URL(string: streamLink)
        else {
            return nil
        }
        
        switch streamType {
        case .twitch:
            return ("TwitchRosa", streamURL)
        case .youtube:
            return ("YoutubeRosa", streamURL)
        case .instagram:
            return ("InstagramRosa", streamURL)
        }
    }
    
    var comunicationLinkImage: (String, URL)? {
        guard let contactLink = event.contactLink,
              let contactURL = URL(string: contactLink)
        else {
            return nil
        }
        switch event.contactType {
        case .discord:
            return ("DiscordRosa", contactURL)
        case .email:
            return ("EmailRosa", contactURL)
        default:
            return nil
        }
    }
    
    init(event: Event) {
        self.event = event
    }
    
    func participate() {
        
    }
    
    func formatEventDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/MM/y | HH:mm"
        
        return formatter.string(from: event.date)
    }
    
    func formatLobbyTimeDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: event.lobbyEntranceDate)
    }
    
    func formatStartTimeDate() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return formatter.string(from: event.eventStartDate)
    }
    
}
