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
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            if let urlString = event.coverUrl {
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                } placeholder: {
                    Rectangle().fill(ColorPalette.secondaryBackground)
                }
            } else {
                Image("Capy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }
            VStack{
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: .infinity , height: 50, alignment: .center)
                        .opacity(0.8)
                        .cornerRadius(8)
                    HStack{
                        VStack (alignment: .leading){
                            Text(event.name)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(ColorPalette.primaryText)
                            Text(event.date, style: .date)
                                .font(.system(size: 10))
                                .foregroundColor(ColorPalette.primaryText)
                        }.padding(.leading, 18)
                        Spacer()
                    }
                }
            }
        }
    }
    
    struct SmallWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            SmallWidgetView(event: EventMock.event)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
