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

}
