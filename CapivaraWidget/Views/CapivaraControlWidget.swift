//
//  CapivaraControlWidget.swift
//  Capivara
//
//  Created by Thallis Sousa on 10/12/21.
//

import SwiftUI
import WidgetKit
import CapivaraWidgetExtension

struct CapivaraControlWidget: View {
   
    let entry: CapivaraEntry
    @Environment(\.widgetFamily) var family
    
    
    
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(eventTitle: "Evento", date: Date())
        case .systemMedium:
            MediumWidgetView(eventTitle: "Evento 2", date: Date(), widgetBackground: ColorPalette.backgroundColor)
        case .systemLarge:
            LargeWidgetView()
        default:
            MediumWidgetView(eventTitle: "Evento teste", date: Date(), widgetBackground: ColorPalette.backgroundColor)
            
        }    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        CapivaraControlWidget(entry: CapivaraEntry)
//            .previewContext(WidgetPreviewContext(family: .systemLarge))
//    }
//}
