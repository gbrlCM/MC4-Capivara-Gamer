//
//  MyEventsViewModel.swift
//  Capivara
//
//  Created by Vitor Cheung on 01/12/21.
//

import Foundation

final class MyEventsViewModel: ObservableObject{
    let repository: EventRepository
    @Published var events: [Event]
    @Published var user: User
    
    init(repository: EventRepository, user: User){
        self.repository = repository
        self.user = UserMock.gamerCapibara
        events = []
        
    }
    
    func fetchEvents() async throws{
        events = try await repository.fetchUserEvents(of: user)
    }
    
}
