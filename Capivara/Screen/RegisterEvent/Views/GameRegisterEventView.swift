//
//  GeneralRegisterEventView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import SwiftUI

struct GameRegisterEventView: View {
    
    @EnvironmentObject
    var viewModel: RegisterEventViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                GeneralRegisterEventGameSection(games: $viewModel.games,
                                                selectedGame: $viewModel.selectedGame)
                
                PlatformSection(selectedPlatform: $viewModel.selectedGameType)
                
                EventTypeSection(selectedEventType: $viewModel.selectedEventType)
                
                ContactTypeSection(selectedContactType: $viewModel.selectedContactType,
                                   contactLink: $viewModel.contactLink,
                                   isLinkValid: $viewModel.isContactTypeFieldValid)
                
                StreamSection(hasStreaming: $viewModel.hasStreaming,
                              selectedStreamingPlatform: $viewModel.selectedStreamType,
                              streamLinkIsValid: $viewModel.isStreamTypeFieldValid,
                              streamLinkContent: $viewModel.streamLink)
                
            }.padding(.leading, 4)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Próx", destination: RulesRegisterEventView())
                    .foregroundColor(ColorPalette.accent)
            }
        }
        .foregroundColor(ColorPalette.primaryText)
        .navigationTitle(RegisterEventTab.game.title)
        .backgroundColor(ColorPalette.backgroundColor)
        .navigationBarTitleColor(ColorPalette.primaryText)
    }
}

struct GameRegisterEventView_Previews: PreviewProvider {
    
    static var previews: some View {
        let vm = RegisterEventViewModel(gameRepository: GameRepositoryMock(), creator: UserMock.gamerCapibara, isShowing: .constant(true), eventRepository: EventRepositoryMock())
        NavigationView {
            GameRegisterEventView()
                .navigationTitle(RegisterEventTab.general.title)
                .navigationBarTitleColor(ColorPalette.primaryText)
        }
        .environmentObject(vm)
        .task { await vm.fetchAllItems() }
        .onAppear {
            UINavigationBar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
        }
    }
}

