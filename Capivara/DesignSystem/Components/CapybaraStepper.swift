//
//  CapybaraPicker.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 07/12/21.
//

import SwiftUI

struct CapybaraStepper: View {
    var body: some View {
        HStack {
            Stepper.init(label: {EmptyView()}, onIncrement: {}, onDecrement: {})
        }
        .foregroundColor(ColorPalette.primaryText)
        .background(ColorPalette.secondaryBackground)
    }
}

struct CapybaraPicker_Previews: PreviewProvider {
    static var previews: some View {
        CapybaraStepper()
            .previewLayout(.sizeThatFits)
    }
}
