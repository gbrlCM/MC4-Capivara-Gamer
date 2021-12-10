//
//  EventFormatSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 06/12/21.
//

import SwiftUI

struct TournamentFormatSection: View {
    @Binding
    var selectedTournamentFormat: TournamentFormat?
    var tournamentFormats: [TournamentFormat] = TournamentFormat.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Formato do evento", isMandatory: true) {
            ForEach(tournamentFormats, id: \.self) { tournamentFormat in
                RegisterEventButton(content: tournamentFormat, isSelected: tournamentFormat == selectedTournamentFormat) {
                    if selectedTournamentFormat == tournamentFormat {
                        selectedTournamentFormat = nil
                    } else {
                        selectedTournamentFormat = tournamentFormat
                    }
                }.padding(.trailing, 8)
            }
        }
    }
}
