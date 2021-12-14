//
//  ColorPaletteAppClip.swift
//  AppClipEventInfo
//
//  Created by Nathalia do Valle Papst on 13/12/21.
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
        Color.white.opacity(0.6)
    }
    
    static var accent: Color {
        Color.accentColor
    }
    
    static var secondaryAccent: Color {
        Color("SecondaryAccentColor")
    }
    
    static var danger: Color {
        Color("DangerColor")
    }
}
