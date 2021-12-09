//
//  SmallWidgetView.swift
//  Capivara
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct SmallWidgetView: View {
    
    let eventTitle: String
    let date: Date
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            Image("Capy")
                .resizable()
                .frame(width: 158, height: 158)
            VStack{
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: .infinity , height: 50, alignment: .center)
                        .opacity(0.6)
                        .cornerRadius(8)
                    HStack{
                        VStack (alignment: .leading){
                            Text("Campeonato de Fifa")
                                .padding(.leading, 5)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(ColorPalette.primaryText)
                            Text("10/12/2021 | 18:30")
                                .padding(.leading, 5)
                                .font(.system(size: 8))
                                .foregroundColor(ColorPalette.secondaryText)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
    
    struct SmallWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            SmallWidgetView(eventTitle: "Evento mais recente", date: Date())
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
