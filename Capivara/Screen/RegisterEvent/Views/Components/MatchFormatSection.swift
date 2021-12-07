//
//  MatchFormatSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 07/12/21.
//

import SwiftUI

struct MatchFormatSection: View {
    @Binding
    var seletectedMatchFormat: MatchFormat?
    var matchFormats: [MatchFormat] = MatchFormat.allCases
    
    var body: some View {
        SingleSelectRegisterEventSection(title: "Formato da partida", isMandatory: true) {
            ForEach(matchFormats, id: \.self) { matchFormat in
                RegisterEventButton(content: matchFormat, isSelected: matchFormat == seletectedMatchFormat) {
                    if seletectedMatchFormat == matchFormat {
                        seletectedMatchFormat = nil
                    } else {
                        seletectedMatchFormat = matchFormat
                    }
                }.padding(.trailing, 8)
            }
        }
    }
}
