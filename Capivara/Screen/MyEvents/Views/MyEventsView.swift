//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//
import Combine
import SwiftUI

struct MyEventsView: View {
    
    @ObservedObject var viewModel: MyEventsViewModel
    
    var body: some View {
        NavigationView {
                if let user = viewModel.user {
                    VStack {
                        Picker("", selection: $viewModel.filterSegmented)
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
                        switch viewModel.statusView{
                        case .ok:
                            listMyEvent
                        case .error:
                            ErrorView()
                        case .loading:
                            LoadView()
                        case .empty:
                            CapybaraEmptyView()
                        }
                        
                    }
                    .navigationTitle("Eventos")
                    .navigationBarTitleColor(ColorPalette.primaryText)
                    .backgroundColor(ColorPalette.backgroundColor)
                    .task{
                        await viewModel.fetchEvents(for: user)
                    }.refreshable {
                        await viewModel.fetchEvents(for: user)
                    }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: viewModel.goToRegister, label: {
                                Image(systemName: "plus")
                            })
                        }
                    }
                    .navigationTitle("Eventos")
                    .navigationBarTitleColor(ColorPalette.primaryText)
                    .backgroundColor(ColorPalette.backgroundColor)
                    } else {
                    VStack {
                        LoadView()
                    }.navigationTitle("Eventos")
                    .navigationBarTitleColor(ColorPalette.primaryText)
                    .backgroundColor(ColorPalette.backgroundColor)
                }
                
            }  .sheet(isPresented: $viewModel.isRegisteringEvent) {
                RegisterEventView(viewModel: RegisterEventViewModel(repository: GameRepository()))
            }.preferredColorScheme(.dark)
                .searchable(text: $viewModel.searchFieldText)
                .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
                .navigationTitle("Eventos")
                .navigationBarTitleColor(ColorPalette.primaryText)
                .backgroundColor(ColorPalette.backgroundColor)
                .task{
                    await viewModel.fetchEvents()
                }.refreshable {
                    await viewModel.fetchEvents()
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: viewModel.goToRegister, label:
                                {
                            Image(systemName: "plus")
                        })
                    }
                }
    }
          
    @ViewBuilder
    var listMyEvent: some View{
        List {
            ForEach(viewModel.filterSegmentedEvents){ content in
                ZStack {
                    NavigationLink(destination: {
                        EventInfoView(viewModel: EventInfoViewModel(event: content))
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
    }
    
}


struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView {
                let publisher = CurrentValueSubject<User?, Never>(nil)
                MyEventsView(viewModel: MyEventsViewModel(repository: EventRepositoryMock(), user: UserMock.gamerCapibara, userPublisher: publisher.eraseToAnyPublisher()))
                    .onAppear {
                        publisher.send(UserMock.gamerCapibara)
                    }
            }
        }
    }
}

