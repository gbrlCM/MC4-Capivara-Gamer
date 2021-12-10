//
//  CapybaraPicker.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 07/12/21.
//

import SwiftUI

struct CapybaraStepper: View {
    @Binding
    var value: Int
    var label: String
    
    var body: some View {
        Stepper(value: $value) {
            VStack(alignment: .leading) {
                Text("\(value)")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.leading)
                Text(label)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }.padding(.trailing, 12)
        }
        .preferredColorScheme(.dark)
        .padding(.all, 24)
        .foregroundColor(ColorPalette.primaryText)
        .background(ColorPalette.secondaryBackground)
        .cornerRadius(10)
    }
}

struct CapybaraPicker_Previews: PreviewProvider {
    static var previews: some View {
        CapybaraStepper(value: .constant(10), label: "Equipes")
            .padding().padding()
            .previewLayout(.sizeThatFits)
    }
}
