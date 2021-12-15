//
//  ContentView.swift
//  AppClipEventInfo
//
//  Created by Nathalia do Valle Papst on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepositoryMock(), user: UserMock.gamerCapibara))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
