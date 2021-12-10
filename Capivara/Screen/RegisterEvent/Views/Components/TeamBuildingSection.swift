//
//  TeamBuildingSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 07/12/21.
//

import SwiftUI

struct TeamBuildingSection: View {
    @Binding
    var isIndividual: Bool
    @Binding
    var parcitipants: Int
    @Binding
    var teams: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Organização de equipes *")
                .font(.title3.bold())
            HStack {
                RegisterEventButton(content: TeamType.idividual, isSelected: isIndividual, action: { withAnimation { isIndividual = true }})
                RegisterEventButton(content: TeamType.group, isSelected: !isIndividual, action: { withAnimation { isIndividual = false } })
                Spacer()
            }
            if !isIndividual {
                Text("Selecione o número de equipes e quantos participantes terão em cada equipe")
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(ColorPalette.secondaryText)
                    .transition(.moveAndFade)
            }
            
            numberSection
            
        }
        .padding()
        .foregroundColor(ColorPalette.primaryText)
    }
    
    @ViewBuilder
    private var numberSection: some View {
        VStack {
            CapybaraStepper(value: $parcitipants, label: isIndividual ? "Participantes" : "Equipes")
                .padding(.bottom, 8)
            
            if !isIndividual {
                CapybaraStepper(value: $teams, label: "Membros de equipe")
                    .transition(.moveAndFade)
            }
        }
        .padding(.top, 8)
    }
    
    private enum TeamType: Presentable {
        case idividual, group
        
        var label: some View {
            switch self {
            case .idividual:
                return Label("Individual", systemImage: "person.fill")
            case .group:
                return Label("Em Grupo", systemImage: "person.3.fill")
            }
        }
    }
}

struct TeamBuildingSection_Previews: PreviewProvider {
    static var previews: some View {
        TeamBuildingSection(isIndividual: .constant(false),
                            parcitipants: .constant(10),
                            teams: .constant(16))
            .background(ColorPalette.backgroundColor)
    }
}
