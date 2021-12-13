//
//  MyEventsViewModel.swift
//  Capivara
//
//  Created by Vitor Cheung on 01/12/21.
//

import Foundation

final class MyEventsViewModel: ObservableObject{
    let repository: EventRepositoryProtocol
    @Published private var events: [Event]
    @Published var user: User
    @Published var searchFieldText: String
    @Published var filterSegmented: MyEventsTab = .all
    @Published var statusView: StatusView = .loading
    
    
    init(repository: EventRepositoryProtocol, user: User){
        self.repository = repository
        self.user = UserMock.gamerCapibara
        events = []
        self.searchFieldText = ""
    }

    var searchedEvents: [Event] {
        if searchFieldText.isEmpty {
            return events
        } else {
            return events.filter{
                $0.name.contains(searchFieldText)
            }
        }
    }
    
    
    
    func fetchEvents() async throws{
        events = try await repository.fetchUserEvents(of: user)
    }
    
    var filterSegmentedEvents: [Event] {
        switch filterSegmented {
        case .all:
            return searchedEvents
        case .current:
            return searchedEvents.filter{
                $0.date > Date.now
            }
        case .created:
            return searchedEvents.filter{
                $0.creator == user
            }
        case .participated:
            return searchedEvents.filter{
                $0.participants.contains(user)

            }
            
        }
        
    }
}


