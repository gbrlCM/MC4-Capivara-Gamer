//
//  EventCardView.swift
//  Capivara
//
//  Created by Vitor Cheung on 30/11/21.
//

import SwiftUI

struct EventCardView: View {
    var text: String
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
            VStack(alignment: .trailing){
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                    .opacity(0.6)
                    .cornerRadius(10 ,corners: .topRight)
                    .cornerRadius(30 ,corners: .bottomLeft)
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
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                            .padding(.trailing)

                    }
                }
            }
        }
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
            EventCardView(text: "oi")
        }
        .previewLayout(.fixed(width: 275, height: 155))

    }
}
