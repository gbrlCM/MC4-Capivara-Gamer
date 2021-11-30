//
//  EventTypeSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct EventTypeSection: View {
    var eventTypes: [EventType] = EventType.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Disputa", isMandatory: true) {
            ForEach(eventTypes, id: \.self) { eventType in
                RegisterEventButton(content: eventType, isSelected: false).padding(.trailing, 8)
            }
        }
    }
}
