//
//  SearchView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ExploreScreenViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.statusView{
                case .ok:
                    okView
                case .error:
                    ErrorView()
                case .loading:
                    LoadView()
                case .empty:
                    CapybaraEmptyView()
                }
            } .backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Explorar")
                .navigationBarTitleColor(ColorPalette.primaryText)
                .task {
                    await viewModel.fetchInitialData()
                }
        }.tabBarLabel(text: "Explorar", systemImage: "square.grid.2x2.fill")
    }
    @ViewBuilder
    var okView: some View {
        
        searchBar
        
        if !viewModel.searchFieldText.isEmpty {
            searched
        }
        
        else {
            feed
        }
        
    }
    
    @ViewBuilder
    var searchBar: some View {
        TextField("Search", text: $viewModel.searchFieldText)
            .foregroundColor(ColorPalette.primaryText)
            .padding(.horizontal,25)
            .padding(7)
            .background(ColorPalette.secondaryBackground)
            .cornerRadius(8)
            .padding(.horizontal, 10)
            .colorScheme(.dark)
        
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(ColorPalette.primaryText.opacity(0.3))
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
            .padding(.bottom, -50)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.games) { game in
                    PopularGame(game: game)
                        .padding(.trailing, 12)
                }
            }
        }
    }
    
    @ViewBuilder
    var recentEvents: some View {
        Text("Eventos recentes")
            .font(.headline.bold())
            .foregroundColor(ColorPalette.primaryText)
        
        
        LazyVStack {
            ForEach(viewModel.allEvents) { content in
                ZStack {
                    NavigationLink(destination: {
                        EventInfoView(viewModel: EventInfoViewModel(event: content))
                    }, label: {
                        EventCardView(event: content)
                    }) .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                        .padding(.bottom, 4)
                }.listRowBackground(ColorPalette.backgroundColor)
            }
        }
    }
    
    @ViewBuilder
    var searched: some View {
        SearchedEventsView(contents: viewModel.searchedEvents)
    }
    
    @ViewBuilder
    var feed: some View {
        ScrollView {
            VStack(alignment: .leading) {
                popularGames
                    .padding()
                
                recentEvents
                    .padding()
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepositoryMock()))
    }
}
