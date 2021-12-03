//
//  EventInfoView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 30/11/21.
//

import SwiftUI

struct EventInfoView: View {
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    Image("Celulol")
                        .resizable()
                        .frame(height: 230)
                    
                    VStack {
                        Spacer()
                        
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading) {
                                Text("Campeonato de LOL")
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
                
                HStack {
                    Text("Sobre o Evento")
                        .foregroundColor(ColorPalette.primaryText)
                        .font(.subheadline.bold())
                    
                    Spacer()
                }.padding()

            }.backgroundColor(ColorPalette.backgroundColor)
                .navigationTitle("Informação do Evento").navigationBarTitleColor(ColorPalette.primaryText)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventInfoView()
            EventInfoView()
                .previewDevice("iPhone 8")
            EventInfoView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
