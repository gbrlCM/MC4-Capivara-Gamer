//
//  RootView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct RootView: View {
    @State
    var selectedTab: TabBarScreen = .search
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MyEventsView(viewModel: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara))
                .tag(TabBarScreen.events)
            SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepository(), user: UserMock.gamerCapibara))
                .tag(TabBarScreen.search)
            UserProfileView(viewModel: UserProfileViewModel())
                .tag(TabBarScreen.profile)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
