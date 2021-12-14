//  TimelineEntry.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import Foundation
import WidgetKit

struct CapivaraEntry: TimelineEntry {
    var date: Date
    let event: Event
    
}
    extension CapivaraEntry {
        
        static var allEvents: MyEventsView {
            MyEventsView(viewModel: MyEventsViewModel.init(repository: EventRepository() as EventRepositoryProtocol, user: UserMock.gamerCapibara))
        }
    }
