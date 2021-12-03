//
//  RootView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct RootView: View {
    @State
    var selectedTab: TabBarScreen = .profile
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MyEventsView(viewModel: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara))
                .tag(TabBarScreen.events)
            SearchView()
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
