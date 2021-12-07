//
//  Picker+SegmentControlColer.swift
//  Capivara
//
//  Created by Vitor Cheung on 01/12/21.
//

import SwiftUI

extension Picker {
    func selectedSegmentTintColor(_ color: Color) -> Picker{
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(ColorPalette.accent)
        return self
    }
    
    func selectedTitleColor(_ color: Color) -> Picker{
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        return self
    }
    
    func unselectedTitleColor(_ color: Color) -> Picker{
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        return self
    }
    
}

