//
//  EmptyView.swift
//  Capivara
//
//  Created by Vitor Cheung on 13/12/21.
//

import SwiftUI

struct CapybaraEmptyView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("emptyState")
                .resizable()
                .frame(width: 110, height: 176)
                .padding()
            Text("Ops, você ainda não tem nenhum evento!")
                .foregroundColor(ColorPalette.accent)
                .font(.title3)
            Text("Navegue pelo app para encontrar eventos")
                .foregroundColor(ColorPalette.accent)
            Spacer()
        }
    }
}
