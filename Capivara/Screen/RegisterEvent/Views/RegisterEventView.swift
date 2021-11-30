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
            TabView {
                GeneralRegisterEventView(viewModel: GeneralRegisterEventViewModel(games: $viewModel.games))
                    .tag(RegisterEventTab.general)
                
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar, content: { Rectangle().fill(ColorPalette.accent).ignoresSafeArea(.all) })
            }
            .navigationTitle(viewModel.selectedTab.title)
            .backgroundColor(ColorPalette.backgroundColor)
            .navigationBarTitleColor(ColorPalette.primaryText)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .task {
                await viewModel.fetchAllItems()
            }
        }
    }
}

struct RegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEventView(viewModel: RegisterEventViewModel(repository: GameRepositoryMock()))
    }
}
