//
//  GeneralRegisterEvent.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 06/12/21.
//

import SwiftUI

struct GeneralRegisterEvent: View {
    var body: some View {
        ScrollView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationTitle("Geral")
        .foregroundColor(ColorPalette.primaryText)
        .navigationBarTitleColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
}

struct GeneralRegisterEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralRegisterEvent()
        }
    }
}
