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
        AsyncImage(url: imageURL) { image in
            image.resizable().scaledToFill().clipShape(Circle())
        } placeholder: {
            Capsule().fill(Color.pink)
        }
        .frame(width: 200, height: 200, alignment: .center)
    }
}
