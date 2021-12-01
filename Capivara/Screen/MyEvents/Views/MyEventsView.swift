//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct MyEventsView: View {
    
    @State private var searchText = ""
    @State private var content = ["COD", "LOL", "cc", "dd", "ee", "paçoquinha", "pudim"]
    @State private var filterSegmented = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("What is your favorite color?", selection: $filterSegmented)
                {
                    Text("Todos").tag(0)
                    Text("Atuais").tag(1)
                    Text("Criados").tag(2)
                    Text("Participados").tag(3)
                }
                .selectedSegmentTintColor(ColorPalette.accent)
                .selectedTitleColor(ColorPalette.primaryText)
                .unselectedTitleColor(ColorPalette.primaryText)
                .pickerStyle(.segmented)
                .padding()

            List {
                ForEach(searchResults, id: \.self){ content in
                    EventCardView(text: content, tileImage: Image("COD"), streamImage: Image("LOL"), gameImage: Image("Freefire"))
                        .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                        .listRowBackground(ColorPalette.backgroundColor)
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .backgroundColor(ColorPalette.backgroundColor)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {} , label: {
                        Image(systemName: "plus")
                    })
                }
            }
            }
            .navigationTitle("Eventos")
            .navigationBarTitleColor(ColorPalette.primaryText)
            .backgroundColor(ColorPalette.backgroundColor)
            
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

