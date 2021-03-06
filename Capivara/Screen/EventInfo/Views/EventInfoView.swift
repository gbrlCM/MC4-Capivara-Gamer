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
                    if let coverUrl = viewModel.event.coverUrl {
                        CapybaraAsyncImage(url: URL(string: coverUrl), contentMode: .fit, cornerRadius: 0)
                    } else {
                        Image("standard")
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
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
                            
#if APPCLIP
                            
#else
                            if let user = viewModel.user,
                                !viewModel.event.participants.contains(user),
                               viewModel.event.creator.id != user.id
                            {
                                Button{viewModel.actionRegister()}
                            label:{
                                Text("Participar")
                            }.foregroundColor(ColorPalette .primaryText)
                                    .frame(width: 90, height: 30)
                                    .background(ColorPalette .accent)
                                    .cornerRadius(21)
                                    .padding()
                            } else {
                                Image(systemName: "checkmark")
                                    .frame(width: 90, height: 30)
                                    .onAppear {
                                        print(viewModel.user)
                                    }
                            }
#endif
                            
                        }.background(ColorPalette.backgroundColor.opacity(0.9))
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            CapybaraAsyncImage(url: URL(string: viewModel.event.game.icon), height: 30, width: 30, cornerRadius: 10)
                            
                            Text("\(viewModel.event.game.name)")
                                .foregroundColor(ColorPalette.primaryText)
                                .font(.system(size: 17, weight: .semibold))
                        }.padding(.bottom)
                        
                        viewModel.event.gamePlatform.label
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(ColorPalette.primaryText)
                    }.padding()
                        .background(ColorPalette.secondaryBackground)
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    if let (image, link) = viewModel.comunicationLinkImage {
                        Link.init(destination: link) {
                            Image(image)
                                .resizable()
                                .frame(width: 30, height: 25)
                        }.padding()
                            .background(Circle().fill(ColorPalette.accent.opacity(0.4)))
                            .frame(width: 44, height: 44)
                    }
                    
                    Spacer()
                    
                    if let (image, link) = viewModel.streamLinkImage {
                        Link.init(destination: link) {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .padding(.all, 2)
                                .frame(width: 28, height: 30)
                        }.padding()
                            .background(Circle().fill(ColorPalette.accent.opacity(0.4)))
                            .frame(width: 44, height: 44)
                    }
                    
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
                            EventInfoTableViewCell(title: "Tipo do Evento", info: "\(viewModel.event.eventType.text)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato do Evento", info: "\(viewModel.event.eventFormat.text)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Formato da Partida", info: "\(viewModel.event.matchFormat.text)")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Jogadores", info: viewModel.teamSizeLabel)
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                            
                            EventInfoTableViewCell(title: "Entrada no Lobby", info: "\(viewModel.formatLobbyTimeDate())")
                            
                            Divider()
                                .background(ColorPalette.secondaryText)
                        }
                        
                        Group {
                            EventInfoTableViewCell(title: "In??cio da Primeira Partida", info: "\(viewModel.formatStartTimeDate())")
                        }
                        
                    }.foregroundColor(ColorPalette.primaryText)
                    
                }.background(RoundedRectangle(cornerRadius: 10).fill(ColorPalette.secondaryBackground))
                    .padding()
                
            }
            .onAppear(perform: {
                print(viewModel.event.game)
            })
            .backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Informa????o do Evento").navigationBarTitleColor(ColorPalette.primaryText)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: getImageSymbol)
        }
    }
    
    func getImageSymbol() {
        switch viewModel.event.gamePlatform {
        case .mobile:
            symbolName = "candybarphone"
        case .pc:
            symbolName = "laptopcomputer"
        case .xbox:
            symbolName = "logo.xbox"
        case .playstation:
            symbolName = "logo.playstation"
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventInfoView(viewModel: EventInfoViewModel(event: EventMock.event, user: UserMock.gamerCapibara,eventRepository: EventRepositoryMock()))
        }
    }
}
