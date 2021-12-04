//
//  StreamSection.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 03/12/21.
//

import SwiftUI

struct StreamSection: View {
    @Binding var hasStreaming: Bool
    @Binding var selectedStreamingPlatform: StreamingType?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Stream")
                    .font(.title2.bold())
                Text("O seu evento será transmitidos online?")
                CapybaraToggle(isOn: $hasStreaming)
                
                if hasStreaming {
                    HorizontalScrollView {
                        ForEach(StreamingType.allCases, id: \.self) { streamingType in
                            RegisterEventButton(content: streamingType, isSelected: selectedStreamingPlatform == streamingType ) {
                                if selectedStreamingPlatform == streamingType {
                                    selectedStreamingPlatform = nil
                                } else {
                                    selectedStreamingPlatform = streamingType
                                }
                            }.padding(.vertical, 2)
                            .padding(.trailing, 8)
                        }
                    }
                    .padding(.vertical)
                    .transition(.moveAndFade)
                }
            }
            .padding(.bottom,8)
        .padding(.horizontal, 12).foregroundColor(ColorPalette.primaryText)
        Spacer()
        }
    }
}

struct StreamSection_Previews: PreviewProvider {
    static var previews: some View {
        StreamSectionPV()
            .padding()
            .background(ColorPalette.backgroundColor)
            .previewLayout(.sizeThatFits)
    }
}

fileprivate struct StreamSectionPV: View {
    @State var hasStreaming = false
    @State var selected: StreamingType? = .youtube
    
    var body: some View {
        StreamSection(hasStreaming: $hasStreaming, selectedStreamingPlatform: $selected)
    }
}
