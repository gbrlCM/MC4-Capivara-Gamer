//
//  MediumWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    
    let eventTitle: String
    let date: Date
    let widgetBackground: Color
    
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 5){
                Text(event)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(ColorPalette.primaryText)
                Text(//////)
                    .font(.system(size: 12))
                    .foregroundColor(ColorPalette.secondaryText)
                HStack{
                    Image(systemName: "logo.playstation")
                        .font(.system(size: 12))
                        .foregroundColor(ColorPalette.secondaryText)
                    Text("PS4")
                        .font(.system(size: 12))
                        .foregroundColor(ColorPalette.secondaryText)
                }
                
            }
            Spacer()
            
            HStack{
                Image("Capy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }
            
        } .padding()
            .background(widgetBackground)
            .backgroundColor(ColorPalette.backgroundColor)
            
    }
    
    struct MediumWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            MediumWidgetView(eventTitle: "Evento mais recente", date: Date(), widgetBackground: ColorPalette.backgroundColor)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}


