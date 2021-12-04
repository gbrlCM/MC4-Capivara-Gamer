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
                GeneralRegisterEventGameSection(games: $viewModel.games, selectedGame: $viewModel.selectedGame)
                PlatformSection(selectedPlatform: $viewModel.selectedGameType)
                EventTypeSection(selectedEventType: $viewModel.selectedEventType)
                ContactTypeSection(selectedContactType: $viewModel.selectedContactType)
                StreamSection(hasStreaming: $viewModel.hasStreaming, selectedStreamingPlatform: .constant(.instagram))
            }.padding(.leading, 4)
        }
        .foregroundColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
}

struct GameRegisterEventView_Previews: PreviewProvider {
    
    static var previews: some View {
        let vm = RegisterEventViewModel(repository: GameRepositoryMock())
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

