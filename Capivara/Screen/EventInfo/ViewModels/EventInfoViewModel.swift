//
//  EventInfoViewModel.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 06/12/21.
//

import Foundation

final class EventInfoViewModel: ObservableObject {
    @Published var event: Event
    
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
    
    func goToDiscord() {
        
    }
    
    func goToTwitch() {
        
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
