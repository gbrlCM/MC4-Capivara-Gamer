//
//  CapybaraAsyncImage.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 27/11/21.
//

import SwiftUI

struct CapybaraAsyncImage: View {
    let url: URL?
    var height: CGFloat? = nil
    var contentMode: ContentMode = .fill
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        AsyncImage(url: url,
                   content: {
            if let height = height {
                $0.resizable().frame(height: height)
            } else {
                $0.resizable()
            }
            
                            },
                   placeholder: { placeholder })
            .cornerRadius(cornerRadius)
            .aspectRatio(1, contentMode: contentMode)
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
