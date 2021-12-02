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
            GameRegisterEventView(games: $viewModel.games,
                                  selectedGame: $viewModel.selectedGame,
                                  selectedGameType: $viewModel.selectedGameType,
                                  selectedEventType: $viewModel.selectedEventType,
                                  selectContactType: $viewModel.selectedContactType)
                .toolbar {
                    ToolbarItem(placement: .bottomBar, content: { Rectangle().fill(ColorPalette.accent).ignoresSafeArea(.all) })
                }
                .navigationTitle(viewModel.selectedTab.title)
                .backgroundColor(ColorPalette.backgroundColor)
                .navigationBarTitleColor(ColorPalette.primaryText)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .task {
                    await viewModel.fetchAllItems()
                }.onAppear {
                    UIToolbar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
                    UINavigationBar.appearance().barTintColor = UIColor(ColorPalette.backgroundColor)
                }
        }
    }
}

struct RegisterEventView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEventView(viewModel: RegisterEventViewModel(repository: GameRepositoryMock()))
    }
}
