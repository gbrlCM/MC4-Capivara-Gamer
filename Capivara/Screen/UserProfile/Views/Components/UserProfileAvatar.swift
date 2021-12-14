//
//  UserProfileAvatar.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileAvatar: View {

    var imageURL: String
    
    var body: some View {
        if let url = URL(string: imageURL) {
            CapybaraAsyncImage(url: url)
                .clipShape(Circle())
            .frame(width: 100, height: 100, alignment: .center)
        } else {
            Image("profile")
                .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}
