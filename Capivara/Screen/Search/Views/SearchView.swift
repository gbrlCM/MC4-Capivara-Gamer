//
//  SearchView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchFieldContent: String = ""
    var body: some View {
        NavigationView {
            VStack{
                searchBar
            } .backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Explorar")
                .navigationBarTitleColor(ColorPalette.primaryText)
        }
        Text("Search")
            .tabBarLabel(text: "Buscar", systemImage: "magnifyingglass")
    }
    
    @ViewBuilder
    var searchBar: some View {
        
        TextField("Search ...", text: $searchFieldContent)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
