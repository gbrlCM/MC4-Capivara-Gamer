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
            SmallWidgetView(event: entry.event)
        case .systemMedium:
            MediumWidgetView(event: entry.event, widgetBackground: ColorPalette.backgroundColor)
        case .systemLarge:
            LargeWidgetView(events: [])
        case .systemExtraLarge:
            ExtraLargeWidgetView()
        default:
            MediumWidgetView(event: entry.event, widgetBackground: ColorPalette.backgroundColor)
            
        }
    }
}


