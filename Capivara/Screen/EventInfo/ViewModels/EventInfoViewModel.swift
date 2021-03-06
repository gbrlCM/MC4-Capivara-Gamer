//
//  EventInfoViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 06/12/21.
//

import Foundation
import SwiftUI

final class EventInfoViewModel: ObservableObject {
    @Published var event: Event
    @Published var user: User?
    private var eventRepository: EventRepositoryProtocol
    
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
    
    var teamSizeLabel: String {
        if event.teamSize == 1 {
            return "\(event.tournamentCapacity) Jogadores"
        }
        
        else {
            return "\(event.tournamentCapacity) Equipes de \(event.teamSize) Jogadores"
        }
    }
    
    init(event: Event, user: User?, eventRepository: EventRepositoryProtocol) {
        self.event = event
        self.user = user
        self.eventRepository = eventRepository
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
        
        return formatter.string(from: Date(timeIntervalSince1970: event.lobbyEntranceDate))
    }
    
    func formatStartTimeDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: Date(timeIntervalSince1970: event.eventStartDate))

    }
    
    func registerToEvent() async {
        
        guard let newUser = user else { return }
        
        do {
            try await eventRepository.registerToEvent(newUser, event: event)
            event.participants.append(newUser)
        } catch {
            print(error.localizedDescription)
        }
       
        
    }
    
    func actionRegister() {
        Task {
            await registerToEvent()
        }
    }
    
}
