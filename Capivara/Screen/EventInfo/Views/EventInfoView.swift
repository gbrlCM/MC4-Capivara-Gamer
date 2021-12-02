//
//  EventInfoView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 30/11/21.
//

import SwiftUI

struct EventInfoView: View {
    var body: some View {
        NavigationView {
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
                            
                        Button(action:{}) {
                            Image("")
                        }
                        Spacer()
                    }
            }.backgroundColor(ColorPalette.backgroundColor)
             .navigationTitle("Informação do Evento").navigationBarTitleColor(ColorPalette.primaryText)
             .navigationBarTitleDisplayMode(.inline)
            }
        }
        
        ScrollView {
            Text("oi").foregroundColor(.white)
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView()
        EventInfoView()
            .previewDevice("iPhone 8")
        EventInfoView()
        .previewDevice("iPhone SE (2nd generation)")
    }
}
