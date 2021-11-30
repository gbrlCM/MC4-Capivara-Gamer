//
//  GeneralRegisterEventView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import SwiftUI

struct GeneralRegisterEventView: View {
    @ObservedObject
    var viewModel: GeneralRegisterEventViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                GeneralRegisterEventGameSection(games: $viewModel.games, selectedID: $viewModel.selectedID)
                PlatformSection()
                EventTypeSection()
                ContactTypeSection()
            }
        }
        .foregroundColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
}

struct GeneralRegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralRegisterEventView(viewModel: .init(games: .constant([GameMock.leagueOfLegends, GameMock.leagueOfLegends, GameMock.leagueOfLegends])))
                .navigationTitle(RegisterEventTab.general.title)
                .navigationBarTitleColor(ColorPalette.primaryText)
        }
        .onAppear {
            UINavigationBar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
        }
    }
}

