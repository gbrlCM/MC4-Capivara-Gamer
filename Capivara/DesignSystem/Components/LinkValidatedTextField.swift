//
//  ValidatedTextField.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 02/12/21.
//

import SwiftUI

struct LinkValidatedTextField: View {
    @Binding
    var content: String
    @Binding
    var isContentValid: Bool
    
    var viewModel: LinkValidatedTextFieldViewModel
    
    var body: some View {
        VStack {
            TextField("", text: $content)
            .onChange(of: content) { newContent in
                isContentValid = viewModel.validator.validate(text: newContent)
            }
            .textInputAutocapitalization(TextInputAutocapitalization.never)
            .disableAutocorrection(true)
            .background {
                if content.isEmpty {
                    HStack {
                        Text(viewModel.placeholder)
                            .foregroundColor(ColorPalette.secondaryText)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 10).fill(ColorPalette.secondaryBackground))
            
            if !isContentValid && content != "" {
                HStack {
                    Text(viewModel.errorMessage)
                        .foregroundColor(ColorPalette.danger)
                    Spacer()
                }.animation(.easeInOut, value: isContentValid)
            }
        }
    }
}

struct LinkValidatedTextFieldViewModel {
    var placeholder: String
    var errorMessage: String
    var validator: Validator
}
