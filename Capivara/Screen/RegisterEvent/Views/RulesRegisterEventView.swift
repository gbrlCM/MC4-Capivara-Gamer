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
    @State var showAlert: Bool = false
    
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
                            do {
                                try await viewModel.finishForm()
                                dismiss()
                            } catch {
                                print(error.localizedDescription)
                                showAlert = true
                            }
                        }
                    }
                    .foregroundColor(.accentColor)
                }
            }.alert("Um erro ocorreu ao tentar registrar o evento.", isPresented: $showAlert) {Button("OK", role: .cancel) { }
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
                .environmentObject(RegisterEventViewModel(gameRepository: GameRepositoryMock(), creator: UserMock.gamerCapibara, isShowing: .constant(true), eventRepository: EventRepositoryMock()))
        }
    }
}
