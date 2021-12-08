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
            VStack {
                photoSection
            }
            
        }
        .navigationTitle("Geral")
        .foregroundColor(ColorPalette.primaryText)
        .navigationBarTitleColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
    
    @ViewBuilder
    private var photoSection: some View {
        VStack(alignment: .leading) {
            Text("Capa do evento")
                .font(.title3.bold())
            Text("Capa que ficará em destaque na pagina do evento.")
                .font(.subheadline)
        }
        
    }
}

struct GeneralRegisterEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralRegisterEvent()
        }
    }
}
