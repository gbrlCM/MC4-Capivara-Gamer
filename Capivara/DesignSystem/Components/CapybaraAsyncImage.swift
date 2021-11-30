//
//  CapybaraAsyncImage.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 27/11/21.
//

import SwiftUI

struct CapybaraAsyncImage: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url,
                   content: { $0.resizable() },
                   placeholder: { placeholder })
            .cornerRadius(10)
            .aspectRatio(1, contentMode: .fill)
    }
    
    @ViewBuilder
    var placeholder: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(ColorPalette.secondaryBackground)
            LoadingCircle()
        }.clipped()
    }
}
