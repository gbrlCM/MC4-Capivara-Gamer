//
//  RegisterEventView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 25/11/21.
//

import SwiftUI

struct RegisterEventView: View {
    
    @ObservedObject
    var viewModel: RegisterEventViewModel
    
    init(viewModel: RegisterEventViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            GeneralRegisterEvent()
        }
        .environmentObject(viewModel)
        .task {
            await viewModel.fetchAllItems()
        }.onAppear {
            UINavigationBar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
        }
    }
}

struct RegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEventView(viewModel: RegisterEventViewModel(gameRepository: GameRepositoryMock(), creator: UserMock.gamerCapibara, isShowing: .constant(true), eventRepository: EventRepositoryMock()))
    }
}
