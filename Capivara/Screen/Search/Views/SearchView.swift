//
//  SearchView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchFieldContent: String = ""
    //@ObservedObject var viewModel: ExploreScreenViewModel
    @ObservedObject var viewModelDois: MyEventsViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading){
                    searchBar
                    
                    popularGames
                        .padding()
                    
                    recentEvents
                        .padding()
                    
                }
            } .backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Explorar")
                .navigationBarTitleColor(ColorPalette.primaryText)
        } .task {
            do {
                try await viewModelDois.fetchEvents()
            } catch  {
            }
        }
    }
    
    @ViewBuilder
    var searchBar: some View {
        TextField("Search", text: $searchFieldContent)
            .foregroundColor(ColorPalette.primaryText)
            .padding(.horizontal,25)
            .padding(7)
            .background(ColorPalette.secondaryBackground)
            .cornerRadius(8)
            .padding(.horizontal, 10)
            .colorScheme(.dark)
        
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(ColorPalette.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 17)
                .padding(.top, -35)
        }
    }
    
    @ViewBuilder
    var popularGames: some View {
        Text("Jogos")
            .font(.headline.bold())
            .foregroundColor(ColorPalette.primaryText)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
                PopularGames(imageURL: $viewModelDois.user.avatar)
            }
        }
    }
    
    @ViewBuilder
    var recentEvents: some View {
        Text("Eventos recentes")
            .font(.headline.bold())
            .foregroundColor(ColorPalette.primaryText)
        

        LazyVStack {
            ForEach(viewModelDois.filterSegmentedEvents){ content in
                ZStack {
                    NavigationLink(destination: {
                        Text(content.name)
                    }, label: {
                        EmptyView()
                    })
                    EventCardView(event: content)
                        .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                        .padding(.bottom, 4)
                }.listRowBackground(ColorPalette.backgroundColor)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModelDois: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara))
    }
}
