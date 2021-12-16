//
//  SmallWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    
    let event: Event
    let widgetBackground: Color
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            HStack{
                VStack (alignment: .leading, spacing: 0){
                    Text(event.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(ColorPalette.primaryText)
                    Text(event.date, style: .date)
                        .font(.system(size: 11)).foregroundColor(ColorPalette.primaryText)
                        .foregroundColor(ColorPalette.secondaryText)
//                    Text(event.gamePlatform.label)
                    
                    event.gamePlatform.labelWidget.opacity(0.5)
                    
                    
                }
                Spacer()
                
            } .padding(10)
                .background(widgetBackground)
                .backgroundColor(ColorPalette.backgroundColor)
                .cornerRadius(10)
        }
        
    }
    
    struct SmallWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            SmallWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
