//
//  EventCardView.swift
//  Capivara
//
//  Created by Vitor Cheung on 30/11/21.
//

import SwiftUI

struct EventCardView: View {
    var text: String
    var tileImage: Image
    var streamImage: Image
    var gameImage: Image
    
    var body: some View{
        ZStack{
            tileImage
                .resizable()
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
                    streamImage
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .fixedSize(horizontal: true, vertical: true)
                        .padding(.trailing, 7.5)
                    
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
                            Text(text)
                                .padding(.leading)
                                .font(.system(size: 24.0))
                                .foregroundColor(Color.blue)
                            Text("Data")
                                .padding(.leading)
                                .foregroundColor(Color.blue)
                        }
                        Spacer()
                        gameImage
                            .resizable()
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

struct RoundedCorner: Shape{
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            EventCardView(text: "Título", tileImage: Image("COD"),streamImage: Image("LOL"), gameImage: Image("Freefire")).frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
        }

    }
}
