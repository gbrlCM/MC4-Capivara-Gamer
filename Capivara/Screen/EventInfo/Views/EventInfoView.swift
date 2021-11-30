//
//  EventInfoView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 30/11/21.
//

import SwiftUI

struct EventInfoView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    image("")
                }
            }.backgroundColor(ColorPalette.backgroundColor)
             .navigationTitle("Informação do Evento").navigationBarTitleColor(ColorPalette.primaryText)
             .navigationBarTitleDisplayMode(.inline)
        }
        
        ScrollView {
            Text("oi").foregroundColor(.white)
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView()
        EventInfoView()
            .previewDevice("iPhone 8")
        EventInfoView()
        .previewDevice("iPhone SE (2nd generation)")
    }
}
