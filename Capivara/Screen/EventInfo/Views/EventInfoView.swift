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
            Form {
            }.navigationTitle("Informação do Evento")
             .navigationBarTitleDisplayMode(.inline)
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
