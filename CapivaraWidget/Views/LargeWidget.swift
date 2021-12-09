//
//  LargeWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View {
    
    let eventTitle: String
    let date: Date
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            VStack{
                HStack {
                    HStack {
                        ZStack {
                            HStack{
                                VStack (alignment: .leading, spacing: 5){
                                    Text("Campeonato de Fifa")
                                        .padding(.leading, 10)
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(ColorPalette.primaryText)
                                    Text("10/12/2021 | 18:30")
                                        .padding(.leading, 10)
                                        .font(.system(size: 14))
                                        .foregroundColor(ColorPalette.secondaryText)
                                    HStack{
                                        Image(systemName: "logo.playstation")
                                            .foregroundColor(ColorPalette.secondaryText)
                                            .padding(.leading, 9)
                                        Text("PS4")
                                            .padding(.trailing)
                                            .font(.system(size: 14))
                                            .foregroundColor(ColorPalette.secondaryText)
                                    }
                                    Spacer()
                                    HStack (alignment: .bottom){
                                        Image("TwitchRosa")
                                            .frame(width: 30, height: 30)
                                            .overlay(Circle().stroke(ColorPalette.secondaryText, lineWidth: 3))
                                            .clipShape(Circle())
                                        
                                        Image("DiscordRosa").scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .overlay(Circle().stroke(ColorPalette.secondaryText, lineWidth: 3))
                                            .clipShape(Circle())
                                        
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image("Capy")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
            }
            .backgroundColor(ColorPalette.backgroundColor)
        }
    }
    
    struct LargeWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            LargeWidgetView(eventTitle: "Evento mais recente", date: Date())
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
