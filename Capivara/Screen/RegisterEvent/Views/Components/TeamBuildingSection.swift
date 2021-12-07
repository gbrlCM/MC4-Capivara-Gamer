//
//  TeamBuildingSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 07/12/21.
//

import SwiftUI

struct TeamBuildingSection: View {
    @State
    var isIndividual: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Organização de equipes")
                .font(.headline.bold())
            HStack {
                RegisterEventButton(content: TeamType.idividual, isSelected: isIndividual, action: { isIndividual = true })
                RegisterEventButton(content: TeamType.group, isSelected: !isIndividual, action: { isIndividual = false })
                Spacer()
            }
            if !isIndividual {
                Text("Selecione o número de equipes e quantos participantes terão em cada equipe")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(ColorPalette.secondaryText)
            }
            
        }.foregroundColor(ColorPalette.primaryText)
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
        TeamBuildingSection()
            .background(ColorPalette.backgroundColor)
            .previewLayout(.sizeThatFits)
    }
}
