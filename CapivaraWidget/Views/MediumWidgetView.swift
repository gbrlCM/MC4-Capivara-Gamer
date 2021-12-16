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
            VStack (alignment: .leading, spacing: 0){
                Text(event.name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(ColorPalette.primaryText)
                Text(event.date, style: .date)
                    .font(.system(size: 16)).foregroundColor(ColorPalette.primaryText)
                    .foregroundColor(ColorPalette.secondaryText)
                event.gamePlatform.labelWidget.opacity(0.5)
            }
            Spacer()
            
        } .padding(10)
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
