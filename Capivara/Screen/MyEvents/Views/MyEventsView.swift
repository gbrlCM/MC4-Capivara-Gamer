//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct MyEventsView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text(searchText)
            }.toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {} , label: {
                            Image(systemName: "plus")
                        })
                    }
            }.navigationTitle("Eventos")
                .searchable(text: $searchText)
        }
        
        .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
    }
    
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MyEventsView()
        }
    }
}
