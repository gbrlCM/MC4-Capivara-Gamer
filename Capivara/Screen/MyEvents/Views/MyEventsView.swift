//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct MyEventsView: View {
    
    @State private var searchText = ""
    @State private var content = ["aa", "bb", "cc", "dd", "ee", "paçoquinha", "pudim"]
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchResults, id: \.self){ content in
                    EventCardView(text: content)
                        .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                    
                    
                    
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {} , label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle("Eventos")
            
        }.searchable(text: $searchText)
            .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
    }
    
    var searchResults: [String] {
        if searchText.isEmpty{
            return content
        }else{
            return content.filter{$0.contains(searchText)}
        }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MyEventsView()
        }
    }
}


