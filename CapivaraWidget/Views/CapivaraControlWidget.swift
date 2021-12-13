//
//  CapivaraControlWidget.swift
//  Capivara
//
//  Created by Thallis Sousa on 10/12/21.
//

import SwiftUI
import WidgetKit


struct CapivaraControlWidget: View {
   
    let entry: CapivaraEntry
    @Environment(\.widgetFamily) var family
    
    
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(event: EventMock.event)
        case .systemMedium:
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
        case .systemLarge:
            LargeWidgetView()
        case .systemExtraLarge:
            ExtraLargeWidgetView()
        default:
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
            
        }    }
}


