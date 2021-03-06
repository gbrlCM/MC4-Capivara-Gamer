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
        
        SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepository(), gameRepository: GameRepository(), user: UserMock.gamerCapibara, userPublisher: .init(UserMock.gamerCapibara)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
