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
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.backgroundColor)
            MediumWidgetView(event: EventMock.event, widgetBackground: ColorPalette.secondaryBackground)
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

