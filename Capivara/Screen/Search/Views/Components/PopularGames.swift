//
//  PopularGames.swift
//  Capivara
//
//  Created by Débora Kassardjian on 07/12/21.
//

import Foundation
import SwiftUI

struct PopularGames: View {
    var imageURL: String
    
    var body: some View {
        CapybaraAsyncImage(url: URL(string: imageURL))
            .clipShape(Circle())
        .frame(width: 150, height: 150, alignment: .center)
    }
}
