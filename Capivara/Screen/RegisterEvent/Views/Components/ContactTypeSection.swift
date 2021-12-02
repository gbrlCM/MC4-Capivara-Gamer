//
//  ContactTypeSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct ContactTypeSection: View {
    @Binding
    var selectedContactType: ContactType?
    var contactTypes: [ContactType] = ContactType.allCases
    
    var body: some View {
        VStack {
            SingleSelectRegisterEventSection(title: "Comunicação", isMandatory: true) {
                ForEach(contactTypes, id: \.self) { contactType in
                    RegisterEventButton(content: contactType, isSelected: selectedContactType == contactType).padding(.trailing, 8)
                        .onTapGesture {
                            if selectedContactType == contactType {
                                selectedContactType = nil
                            } else {
                                selectedContactType = contactType
                            }
                        }
                }
            }
            
            if selectedContactType == .discord {
                Text("discord")
            } else if selectedContactType == .email {
                Text("email")
            }
        }
    }
}
