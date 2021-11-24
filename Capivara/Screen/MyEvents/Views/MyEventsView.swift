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
            GeometryReader { proxy in
                List {
                    ForEach(searchResults, id: \.self){ content in
                        EventCardView(text: content)
                            .frame(width: proxy.size.width, height: proxy.size.width*0.3)
                            .background(Color.pink)
                            .padding(.bottom, 4)
                        
                    }.listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
            
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


struct EventCardView: View {
    var text: String
    
    var body: some View{
        Text(text)
            
    }
}
