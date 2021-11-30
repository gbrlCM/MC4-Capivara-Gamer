//
//  UserProfileAvatar.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileAvatar: View {
    @Binding
    var imageURL: URL?
    
    var body: some View {
        CapybaraAsyncImage(url: imageURL)
            .clipShape(Circle())
        .frame(width: 100, height: 100, alignment: .center)
    }
}
