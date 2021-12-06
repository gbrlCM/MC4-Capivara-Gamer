//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct MyEventsView: View {
    var body: some View {
        Text("My events view")
            .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
        print("")
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
