//
//  HorizontalScrollView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

struct HorizontalScrollView<Content: View>: ContainerView {
    var content: () -> Content
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(content: content)
        }
    }
}
