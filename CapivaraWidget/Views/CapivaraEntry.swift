//
//  TimelineEntry.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import Foundation
import WidgetKit

struct CapivaraEntry: TimelineEntry {
    var date: Date
    
    //pegar todos os eventos
    let totalEvents: MyEventsView
    let isPlaceHolder = false
    
}

extension CapivaraEntry {
    
    static var allEvents: MyEventsView {
        MyEventsView(viewModel: MyEventsViewModel.init(repository: EventRepository() as EventRepositoryProtocol, user: UserMock.gamerCapibara))
    }
}
