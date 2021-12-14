//
//  MediumWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    
    let event: Event
    let widgetBackground: Color
    
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 5){
                Text(event.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(ColorPalette.primaryText)
                Text(event.date, style: .date)
                    .font(.system(size: 12))
                    .foregroundColor(ColorPalette.secondaryText)
                event.gamePlatform.label.opacity(0.5).font(.system(size: 8))
            }
            Spacer()
            
            HStack{
                if let urlString = event.coverUrl {
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    } placeholder: {
                        Rectangle().fill(ColorPalette.secondaryBackground)
                    }.cornerRadius(10)
                } else {
                    Image("Capy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
            }
        } .padding()
            .background(widgetBackground)
            .backgroundColor(ColorPalette.backgroundColor)
            .cornerRadius(10)
    }
    
    struct MediumWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}


