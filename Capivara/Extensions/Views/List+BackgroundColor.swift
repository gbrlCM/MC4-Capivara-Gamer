//
//  List+BackgroundColor.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

extension List {
    
    func backgroundColor(_ color: Color) -> some View {
        if let cgColor = color.cgColor {
            UITableView.appearance().backgroundColor = UIColor(cgColor: cgColor)
        }
        return self
    }
}
