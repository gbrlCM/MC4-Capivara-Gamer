//
//  EventTypeSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct EventTypeSection: View {
    @Binding
    var selectedEventType: EventType?
    
    var eventTypes: [EventType] = EventType.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Disputa", isMandatory: true) {
            ForEach(eventTypes, id: \.self) { eventType in
                RegisterEventButton(content: eventType, isSelected: eventType == selectedEventType) {
                    if selectedEventType == eventType {
                        selectedEventType = nil
                    } else {
                        selectedEventType = eventType
                    }
                }
                .padding(.vertical, 2)
                .padding(.trailing, 8)
            }
        }
    }
}
