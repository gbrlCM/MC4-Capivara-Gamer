//
//  ErrorView.swift
//  Capivara
//
//  Created by Vitor Cheung on 13/12/21.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("error")
                .resizable()
                .frame(width: 100, height: 200)
                .padding()
            Text("Oh no, parece que deu algum erro!")
                .foregroundColor(ColorPalette.accent)
                .font(.title3)
            Text("Tente novamente mais tarde")
                .foregroundColor(ColorPalette.accent)
            Spacer()
        }
    }
}
