//
//  MyEventsView.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 22/11/21.
//

import SwiftUI

struct MyEventsView: View {
    
    @State private var searchText = ""
    @State private var content = ["aa", "bb", "cc", "dd", "ee", "paçoquinha", "pudim"]
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchResults, id: \.self){ content in
                    EventCardView(text: content)
                        .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                    
                    
                    
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {} , label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle("Eventos")
            
        }.searchable(text: $searchText)
            .tabBarLabel(text: "Eventos", systemImage: "newspaper.fill")
    }
    
    var searchResults: [String] {
        if searchText.isEmpty{
            return content
        }else{
            return content.filter{$0.contains(searchText)}
        }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MyEventsView()
        }
    }
}


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
