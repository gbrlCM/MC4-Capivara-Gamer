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
            MyEventsView()
                .tag(TabBarScreen.events)
            SearchView()
                .tag(TabBarScreen.search)
            UserProfileView()
                .tag(TabBarScreen.profile)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
