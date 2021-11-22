//
//  SearchView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        Text("Search")
            .tabBarLabel(text: "Buscar", systemImage: "magnifyingglass")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
