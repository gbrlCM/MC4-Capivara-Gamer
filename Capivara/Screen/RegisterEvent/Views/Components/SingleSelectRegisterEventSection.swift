//
//  SingleSelectRegisterEventSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct SingleSelectRegisterEventSection<Content: View>: View {
    var title: String
    var isMandatory: Bool = false
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title) \(isMandatory ? "*": " ")")
                .font(.title3.bold())
            
            HorizontalScrollView {
                content()
                    .padding(.vertical, 2)
            }
        }
        .padding(.bottom,8)
        .padding(.horizontal, 12)
    }
}
