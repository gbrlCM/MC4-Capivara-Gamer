//
//  MyEventsViewModel.swift
//  Capivara
//
//  Created by Vitor Cheung on 01/12/21.
//

import Foundation
import Combine
import SwiftUI

final class MyEventsViewModel: ObservableObject{
    let repository: EventRepositoryProtocol
    @Published private var events: [Event]
    @Published var user: User?
    @Published var searchFieldText: String
    @Published var filterSegmented: MyEventsTab = .all
    @Published var statusView: StatusView = .loading
    @Published var isRegisteringEvent: Bool
    
    
    init(repository: EventRepositoryProtocol, user: User?, userPublisher: AnyPublisher<User?, Never>){
        self.repository = repository
        self.user = user
        events = []
        self.searchFieldText = ""
        self.isRegisteringEvent = false
        userPublisher.receive(on: RunLoop.main).assign(to: &$user)
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
    
    
    
    func fetchEvents(for user: User) async {
        statusView = .loading
        do {
            events = try await repository.fetchUserEvents(of: user)
            statusView = .ok
        } catch {
            statusView = .error
        }
    }
    
    func goToRegister() {
        isRegisteringEvent = true
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
            guard let user = user else {
                return []
            }
            return searchedEvents.filter{
                $0.participants.contains(user)

            }
        }
    }
}


