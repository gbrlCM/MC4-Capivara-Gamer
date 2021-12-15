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
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                TournamentFormatSection(selectedTournamentFormat: $viewModel.selectedTournamentType)
                MatchFormatSection(seletectedMatchFormat: $viewModel.selectedMatchType)
                TeamBuildingSection(isIndividual: $viewModel.isIndividual,
                                    parcitipants: $viewModel.numberOfParticipants,
                                    teams: $viewModel.numberOfParticipantsPerTeam)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Finalizar") {
                        Task {
                            await viewModel.finishForm()
                            dismiss()
                    }
                    }
                    .foregroundColor(.accentColor)
                }
            }
            .padding(.top, 8)
        }
        .navigationBarTitleColor(ColorPalette.primaryText)
        .navigationTitle(RegisterEventTab.rules.title)
        .backgroundColor(ColorPalette.backgroundColor)
        .foregroundColor(ColorPalette.primaryText)
    }
}

struct RulesRegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RulesRegisterEventView()
                .environmentObject(RegisterEventViewModel(repository: GameRepositoryMock(), creator: UserMock.gamerCapibara, isShowing: .constant(true)))
        }
    }
}
