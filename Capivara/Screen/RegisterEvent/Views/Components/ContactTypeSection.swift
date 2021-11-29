//
//  ContactTypeSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct ContactTypeSection: View {
    var contactTypes: [ContactType] = ContactType.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Comunicação", isMandatory: true) {
            ForEach(contactTypes, id: \.self) { contactType in
                RegisterEventButton(content: contactType, isSelected: false)
            }
        }
    }
}
