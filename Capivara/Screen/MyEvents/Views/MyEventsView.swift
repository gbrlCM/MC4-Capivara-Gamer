//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

enum MyEventsTab: String, CaseIterable {
    case all = "Todos"
    case current = "Atuais"
    case created = "Criados"
    case participated = "Participados"
}

struct MyEventsView: View {
    
    @State private var filterSegmented: MyEventsTab = .all
    @ObservedObject var viewModel: MyEventsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("What is your favorite color?", selection: $filterSegmented)
                {
                    ForEach(MyEventsTab.allCases, id: \.self) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .selectedSegmentTintColor(ColorPalette.accent)
                .selectedTitleColor(ColorPalette.primaryText)
                .unselectedTitleColor(ColorPalette.primaryText)
                .pickerStyle(.segmented)
                .padding()

                List {
                    ForEach(viewModel.searchedEvents){ content in
                        ZStack {
                            NavigationLink(destination: {
                                Text(content.name)
                            }, label: {
                               EmptyView()
                        })
                            EventCardView(event: content)
                            .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                        }.listRowBackground(ColorPalette.backgroundColor)

                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .backgroundColor(ColorPalette.backgroundColor)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {} , label: {
                        Image(systemName: "plus")
                    })
                }
            }
            }
            .navigationTitle("Eventos")
            .navigationBarTitleColor(ColorPalette.primaryText)
            .backgroundColor(ColorPalette.backgroundColor)
            .task{
                do {
                    try await viewModel.fetchEvents()
                } catch  {
                    
                }
            }
        }.searchable(text: $viewModel.searchFieldText)
            .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
    }
    
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MyEventsView(viewModel: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara))
        }
    }
}

