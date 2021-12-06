//
//  EventInfoView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 30/11/21.
//

import SwiftUI

struct EventInfoView: View {
    @ObservedObject var viewModel: EventInfoViewModel
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
                                Text("24/11/2021 | 15:30")
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
                            Image("CelulolLogo")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(50)
                            
                            Text("League Of Legends")
                                .foregroundColor(ColorPalette.primaryText)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        
                        HStack {
                            Image(systemName: "logo.playstation")
                            
                            Text("PS4")
                                .font(.system(size: 14, weight: .semibold))
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
                
                Text("É um jogo eletrônico online gratuito, do gênero batalha multijogador, desenvolvido e publicado pela Riot Games em 2009,[3] para os sistemas Microsoft Windows e Mac OS X, inspirado no modo Defense of the Ancients[4] do jogo Warcraft III: The Frozen Throne.[5]")
                    .foregroundColor(ColorPalette.primaryText)
                    .padding()
                
                Spacer()
                
                HStack {
                    Text("Sobre o Evento")
                        .padding(.leading)
                        .foregroundColor(ColorPalette.primaryText)
                        .font(.subheadline.bold())
                    
                    Spacer()
                }
                
                LazyVStack {
                    VStack(alignment: .leading) {
                        Group {
                            EventInfoTableViewCell(title: "Tipo do Evento", info: "Campeonato")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato do Evento", info: "Round Robin")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato da Partida", info: "Melhor de 1")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Jogadores", info: "3 times com 3 jogadores em cada")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Entrada no Lobby", info: "15:30")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                        }
                        
                        Group {
                            EventInfoTableViewCell(title: "Início da Primeira Partida", info: "16:00")
                        }
                                                
                    }.foregroundColor(ColorPalette.primaryText)
                    
                }.background(RoundedRectangle(cornerRadius: 10).fill(ColorPalette.secondaryBackground))
                    .padding()

            }.backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Informação do Evento").navigationBarTitleColor(ColorPalette.primaryText)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventInfoView(viewModel: EventInfoViewModel(event: EventMock.event))
        }
    }
}
