//
//  ExtraLargeWidgetView.swift
//  CapivaraWidgetExtension
//
//  Created by Thallis Sousa on 13/12/21.
//

import SwiftUI
import WidgetKit

struct ExtraLargeWidgetView: View {
    var body: some View {
        VStack {
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.secondaryBackground)
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
                
        }.padding()
        .backgroundColor(ColorPalette.backgroundColor)
    }
    
    struct ExtraLargeWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            ExtraLargeWidgetView()
                .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
        }
    }
}
