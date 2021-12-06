//
//  EventCardView.swift
//  Capivara
//
//  Created by Vitor Cheung on 30/11/21.
//

import SwiftUI

struct EventCardView: View {
    var event: Event
    
    var body: some View{
        ZStack{
            CapybaraAsyncImage(url: URL(string: event.coverUrl ?? ""))
                .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                .cornerRadius(10)
            VStack(alignment: .trailing){
                ZStack (alignment: .trailing){
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 50, height: 50)
                        .opacity(0.6)
                        .cornerRadius(10 ,corners: .topRight)
                    .cornerRadius(70 ,corners: .bottomLeft)
////                    streamImage
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .clipShape(Circle())
//                        .fixedSize(horizontal: true, vertical: true)
//                        .padding(.trailing, 7.5)
                    
                }
                Spacer()
                ZStack(alignment: .leading){
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.6)
                        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                        .cornerRadius(10, corners: [.bottomLeft,.bottomRight])

                    HStack{
                        VStack(alignment: .leading){
                            Text(event.name)
                                .padding(.leading)
                                .font(.title2.bold())
                                .foregroundColor(ColorPalette.primaryText)
                            Text(event.date, style: .date)
                                .padding(.leading)
                                .foregroundColor(ColorPalette.primaryText)
                        }
                        Spacer()
                        CapybaraAsyncImage(url: URL(string: event.game.icon))
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .fixedSize(horizontal: true, vertical: true)
                            .padding(.trailing, 7.5)
                    }
                }
            }
        }.backgroundColor(ColorPalette.backgroundColor)

    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            EventCardView(event: EventMock.event)
        }

    }
}
