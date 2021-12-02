//
//  GeneralRegisterEventView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import SwiftUI

struct GameRegisterEventView: View {
    @Binding
    var games: [Game]
    @Binding
    var selectedGame: Game?
    @Binding
    var selectedGameType: GameType?
    @Binding
    var selectedEventType: EventType?
    @Binding
    var selectContactType: ContactType?
    
    var body: some View {
        ScrollView {
            VStack {
                GeneralRegisterEventGameSection(games: $games, selectedGame: $selectedGame)
                PlatformSection(selectedPlatform: $selectedGameType)
                EventTypeSection(selectedEventType: $selectedEventType)
                ContactTypeSection(selectedContactType: $selectContactType)
            }.padding(.horizontal, 4)
        }
        .foregroundColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
}

struct GameRegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameRegisterEventView(games: .constant([GameMock.leagueOfLegends, GameMock.leagueOfLegends, GameMock.leagueOfLegends]),
                                  selectedGame: .constant(nil),
                                  selectedGameType: .constant(nil),
                                  selectedEventType: .constant(nil),
                                  selectContactType: .constant(nil)
            )
                .navigationTitle(RegisterEventTab.general.title)
                .navigationBarTitleColor(ColorPalette.primaryText)
        }
        .onAppear {
            UINavigationBar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
        }
    }
}

