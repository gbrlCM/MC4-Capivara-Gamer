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
    @Binding
    var contactLink: String
    @Binding
    var isLinkValid: Bool
    
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
                                contactLink = ""
                            }
                        }
                    }
                    .padding(.trailing, 8)

                }
            }
            
            if selectedContactType == .discord {
                LinkSection(linkContent: $contactLink, isValid: $isLinkValid, viewModel: LinkSectionViewModelFactory.buildForDiscord())
                    .padding()
                    .transition(.moveAndFade)
            } else if selectedContactType == .email {
                LinkSection(linkContent: $contactLink, isValid: $isLinkValid, viewModel: LinkSectionViewModelFactory.buildForEmail())
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
