//
//  CapybaraToggle.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 03/12/21.
//

import SwiftUI

struct CapybaraToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            button(title: "Sim",
                   systemImage: "checkmark",
                   toogleValue: true)
            Spacer().frame(width: 8)
            button(title: "Não",
                   systemImage: "xmark",
                   toogleValue: false)
        }
        
        .background(RoundedRectangle(cornerRadius: 10).fill(ColorPalette.secondaryBackground))
        .foregroundColor(ColorPalette.primaryText)
    }
    
    @ViewBuilder
    private var isSelectedOverlay: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).stroke(ColorPalette.accent)
            RoundedRectangle(cornerRadius: 10).fill(ColorPalette.accent.opacity(0.3))
        }
    }
    
    @ViewBuilder
    private func button(title: String, systemImage: String, toogleValue: Bool) -> some View {
        Button(action: { withAnimation { isOn = toogleValue } }) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .padding()
                .overlay { if isOn == toogleValue { isSelectedOverlay } }
                .animation(.easeOut, value: isOn)
        }
    }
}

struct CapybaraToggle_Previews: PreviewProvider {
    static var previews: some View {
        PVCapybaraToggle()
            .padding()
            .background(ColorPalette.backgroundColor)
            .previewLayout(.sizeThatFits)
    }
}

struct PVCapybaraToggle: View {
    @State var toogle: Bool = false
    var body: some View {
        CapybaraToggle(isOn: $toogle)
    }
}
