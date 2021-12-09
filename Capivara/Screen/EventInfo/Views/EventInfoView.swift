//
//  EventInfoView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 30/11/21.
//

import SwiftUI

struct EventInfoView: View {
    @ObservedObject var viewModel: EventInfoViewModel
    @State var symbolName: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    CapybaraAsyncImage(url: URL(string: viewModel.event.coverUrl!), contentMode: .fit, cornerRadius: 0)
                    
                    VStack {
                        Spacer()
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text(viewModel.event.name)
                                    .font(.system(size: 24, weight: .bold, design: .default))
                                Text("\(viewModel.formatEventDate())")
                            }.foregroundColor(ColorPalette.primaryText)
                                .padding()
                            
                            Spacer()
                            
                            Button(action:{}) {
                                Text("Participar")
                            }.foregroundColor(ColorPalette.primaryText)
                                .frame(width: 90, height: 30)
                                .background(ColorPalette.accent)
                                .cornerRadius(21)
                                .padding()
                        }.background(ColorPalette.backgroundColor.opacity(0.9))
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            CapybaraAsyncImage(url: URL(string: viewModel.event.game.icon), height: 30, width: 30, cornerRadius: 10)
                            
                            Text("\(viewModel.event.game.name)")
                                .foregroundColor(ColorPalette.primaryText)
                                .font(.system(size: 17, weight: .semibold))
                        }
                        
                        HStack {
                            Image(systemName: symbolName)
                            
                            #warning("Reimplementar isso")
                            Text("oi")
                                .font(.system(size: 17, weight: .semibold))
                        }.foregroundColor(ColorPalette.primaryText)
                    }.padding()
                        .background(ColorPalette.secondaryBackground)
                        .cornerRadius(10)
                        .padding()
                    
                    Spacer()
                    
                    Button(action:{}) {
                        Image("DiscordRosa")
                            .resizable()
                            .frame(width: 30, height: 25)
                    }.padding()
                     .background(ColorPalette.accent.opacity(0.4))
                     .frame(width: 50, height: 50)
                     .cornerRadius(50)
                    
                    Spacer()
                    
                    Button(action:{}) {
                        Image("TwitchRosa")
                            .resizable()
                            .frame(width: 28, height: 30)
                    }.padding()
                     .background(ColorPalette.accent.opacity(0.4))
                     .frame(width: 50, height: 50)
                     .cornerRadius(50)
                    
                    Spacer()
                }
                
                Text("\(viewModel.event.description)")
                    .foregroundColor(ColorPalette.primaryText)
                    .padding()
                
                Spacer()
                
                HStack {
                    Text("Sobre o Evento")
                        .padding(.leading)
                        .foregroundColor(ColorPalette.primaryText)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }
                
                LazyVStack {
                    VStack(alignment: .leading) {
                        Group {
                            EventInfoTableViewCell(title: "Tipo do Evento", info: "\(viewModel.event.eventType)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato do Evento", info: "\(viewModel.event.eventFormat)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato da Partida", info: "\(viewModel.event.matchFormat)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Jogadores", info: "\(viewModel.event.tournamentCapacity) Individualmente")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Entrada no Lobby", info: "\(viewModel.formatLobbyTimeDate())")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                        }
                        
                        Group {
                            EventInfoTableViewCell(title: "Início da Primeira Partida", info: "\(viewModel.formatStartTimeDate())")
                        }
                                                
                    }.foregroundColor(ColorPalette.primaryText)
                    
                }.background(RoundedRectangle(cornerRadius: 10).fill(ColorPalette.secondaryBackground))
                    .padding()

            }.backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Informação do Evento").navigationBarTitleColor(ColorPalette.primaryText)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: getImageSymbol)
        }
    }
    
    func getImageSymbol() {
//        switch viewModel.event.game.type {
//        case .mobile:
//            symbolName = "candybarphone"
//        case .pc:
//            symbolName = "laptopcomputer"
//        case .xbox:
//            symbolName = "logo.xbox"
//        case .playstation:
//            symbolName = "logo.playstation"
//        }
        symbolName = "logo.playstation"
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventInfoView(viewModel: EventInfoViewModel(event: EventMock.event))
        }
    }
}
