//
//  View+cornerRadius.swift
//  Capivara
//
//  Created by Vitor Cheung on 06/12/21.
//

import SwiftUI

extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
