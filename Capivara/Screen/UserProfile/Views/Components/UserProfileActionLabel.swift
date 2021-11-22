//
//  UserProfileActionLabel.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct UserProfileActionLabel<S: StringProtocol>: View {
    let isCentered: Bool
    let text: S
    
    init(isCentered: Bool = true, text: S) {
        self.isCentered = isCentered
        self.text = text
    }
    
    var body: some View {
        HStack {
            if isCentered {
                Spacer()
            }
            Text(text)
                .padding(.leading, isCentered ? 0 : 16)
            Spacer()
        }
    }
}
