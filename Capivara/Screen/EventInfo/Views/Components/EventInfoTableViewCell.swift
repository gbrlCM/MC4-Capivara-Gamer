//
//  EventInfoTableViewCell.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 03/12/21.
//

import SwiftUI

struct EventInfoTableViewCell: View {
    var title: String
    var info: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorPalette.primaryText)
                
                
                Text(info)
                    .padding(.trailing)
                    .font(.system(size: 14))
                    .foregroundColor(ColorPalette.secondaryText)
                    
            }
            
            Spacer()
        }.padding()
    }
}

struct EventInfoTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoTableViewCell(title: "Tipo do Evento", info: "Campeonato")
            .background(ColorPalette.secondaryBackground)
    }
}
