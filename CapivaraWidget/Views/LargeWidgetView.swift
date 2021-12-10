//
//  LargeWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View {
    
    var body: some View {
        VStack {
            MediumWidgetView(eventTitle: "Evento 1", date: Date(), widgetBackground: ColorPalette.backgroundColor)
            MediumWidgetView(eventTitle: "Evento 2 ", date: Date(), widgetBackground: ColorPalette.secondaryBackground)
                .cornerRadius(10)
        } .padding()
            .backgroundColor(ColorPalette.backgroundColor)
    }
    
    struct LargeWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            LargeWidgetView()
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

