//
//  SmallWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    
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
                                }
                                HStack{
                                    Image("Capy")
                                        .resizable(resizingMode: scaledToFit() as! Image.ResizingMode)
                                        .frame(width: 120, height: 120, alignment: .trailing)
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
    
    struct MediumWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            MediumWidgetView(eventTitle: "Evento mais recente", date: Date())
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
