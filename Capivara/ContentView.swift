//
//  ContentView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        RootView()
//        LoginView(viewModel: .init(repository: UserRepositoryMock()))
        
//        SearchView(viewModel: ExploreScreenViewModel(eventRepository: EventRepositoryMock(), gameRepository: GameRepository(), user: UserMock.gamerCapibara))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
            .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
