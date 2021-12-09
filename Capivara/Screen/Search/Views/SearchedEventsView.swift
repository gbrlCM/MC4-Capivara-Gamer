//
//  SearchedEventsView.swift
//  Capivara
//
//  Created by Nathalia do Valle Papst on 08/12/21.
//

import SwiftUI

struct SearchedEventsView: View {
    var contents: [Event]
    
    var body: some View {
        List {
            ForEach(contents) { content in
                ZStack {
                    NavigationLink(destination: {
                        EventInfoView(viewModel: EventInfoViewModel(event: content))
                    }, label: {
                        EmptyView()
                    })
                    EventCardView(event: content)
                        .frame(maxWidth: .infinity, minHeight: 155, maxHeight: 155)
                }.listRowBackground(ColorPalette.backgroundColor)
                
            }.listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .backgroundColor(ColorPalette.backgroundColor)
    }
}

struct SearchedEventsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedEventsView(contents: EventMock.events)
    }
}
