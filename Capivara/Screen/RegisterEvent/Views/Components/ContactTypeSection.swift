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
    @State
    var l: String = ""
    @State
    var i: Bool = false
    
    var body: some View {
        VStack {
            SingleSelectRegisterEventSection(title: "Comunicação", isMandatory: true) {
                ForEach(contactTypes, id: \.self) { contactType in
                    RegisterEventButton(content: contactType, isSelected: selectedContactType == contactType) {
                        withAnimation {
                            if selectedContactType == contactType {
                                selectedContactType = nil
                            } else {
                                selectedContactType = contactType
                            }
                        }
                    }
                    .padding(.trailing, 8)

                }
            }
            
            if selectedContactType == .discord {
                LinkSection(linkContent: $l, isValid: $i, viewModel: LinkSectionViewModelFactory.buildForDiscord())
                    .padding()
                    .transition(.moveAndFade)
            } else if selectedContactType == .email {
                LinkSection(linkContent: $l, isValid: $i, viewModel: LinkSectionViewModelFactory.buildForEmail())
                    .padding()
                    .transition(.moveAndFade)
            }
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
}
