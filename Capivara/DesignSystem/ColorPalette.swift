//
//  ColorPalette.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import SwiftUI

enum ColorPalette {
    static var backgroundColor: Color {
        Color("BackgroundColor")
    }
    
    static var secondaryBackground: Color {
        Color("SecondaryBackgroundColor")
    }
    
    static var primaryText: Color {
        Color.white
    }
    
    static var secondaryText: Color {
        Color.white.opacity(0.7)
    }
    
    static var accent: Color {
        Color.accentColor
    }
}
