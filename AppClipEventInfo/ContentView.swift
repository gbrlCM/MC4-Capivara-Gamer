//
//  ContentView.swift
//  AppClipEventInfo
//
//  Created by Nathalia do Valle Papst on 13/12/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        
        SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepositoryMock(), user: nil, userPublisher: .init(nil)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
