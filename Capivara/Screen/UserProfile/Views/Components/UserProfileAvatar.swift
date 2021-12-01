//
//  UserProfileAvatar.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileAvatar: View {
    @Binding
    var imageURL: String
    
    var body: some View {
        CapybaraAsyncImage(url: URL(string: imageURL))
            .clipShape(Circle())
        .frame(width: 100, height: 100, alignment: .center)
    }
}
