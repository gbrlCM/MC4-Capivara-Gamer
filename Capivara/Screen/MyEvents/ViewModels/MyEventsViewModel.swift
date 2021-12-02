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
    
}

