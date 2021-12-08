//
//  LinkSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import SwiftUI

struct LinkSection: View {
    @Binding
    var linkContent: String
    @Binding
    var isValid: Bool
    let viewModel: LinkSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .font(.title3.bold())
            Text(viewModel.subtitle)
            
            LinkValidatedTextField(content: $linkContent,
                                   isContentValid: $isValid,
                                   viewModel: .init(placeholder: viewModel.placeholder,
                                                    errorMessage: viewModel.errorMessage,
                                                    validator: viewModel.validator))
        }
        .foregroundColor(ColorPalette.primaryText)
    }
}
