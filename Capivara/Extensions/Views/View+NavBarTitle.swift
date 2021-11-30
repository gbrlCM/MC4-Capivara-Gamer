//
//  View+NavBarTitle.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 26/11/21.
//

import SwiftUI

extension View {
    
    func navigationBarTitleColor(_ color: Color) -> some View {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(color)]
        
        return self
    }
}
