//
//  RulesRegisterEventView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 06/12/21.
//

import SwiftUI

struct RulesRegisterEventView: View {
    @EnvironmentObject
    var viewModel: RegisterEventViewModel
    
    var body: some View {
        VStack {
            TournamentFormatSection(selectedTournamentFormat: $viewModel.selectedTournamentType)
            Spacer()
        }.padding(.top, 8)
        .navigationBarTitleColor(ColorPalette.primaryText)
        .foregroundColor(ColorPalette.primaryText)
    }
}

struct RulesRegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RulesRegisterEventView()
                .environmentObject(RegisterEventViewModel(repository: GameRepositoryMock()))
                .navigationTitle(RegisterEventTab.rules.title)
                .backgroundColor(ColorPalette.backgroundColor)
        }
    }
}
