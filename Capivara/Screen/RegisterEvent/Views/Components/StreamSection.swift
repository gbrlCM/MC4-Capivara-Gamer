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
    @Binding var streamLinkIsValid: Bool
    @Binding var streamLinkContent: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Stream")
                    .font(.title2.bold())
                Text("O seu evento será transmitido online?")
                CapybaraToggle(isOn: $hasStreaming)
                
                if hasStreaming {
                    hasStreamingSection
                    streamingLinkField
                }
            }
            .padding(.bottom,8)
        .padding(.horizontal, 12).foregroundColor(ColorPalette.primaryText)
        Spacer()
        }
    }
    
    @ViewBuilder
    var hasStreamingSection: some View {
        HorizontalScrollView {
            ForEach(StreamingType.allCases, id: \.self) { streamingType in
                RegisterEventButton(content: streamingType, isSelected: selectedStreamingPlatform == streamingType ) {
                    if selectedStreamingPlatform == streamingType {
                        selectedStreamingPlatform = nil
                    } else {
                        selectedStreamingPlatform = streamingType
                        streamLinkContent = ""
                    }
                }.padding(.vertical, 2)
                .padding(.trailing, 8)
            }
        }
        .padding(.vertical)
        .transition(.moveAndFade)
    }
    
    @ViewBuilder
    var streamingLinkField: some View {
        if selectedStreamingPlatform == .youtube {
            LinkSection(linkContent: $streamLinkContent,
                        isValid: $streamLinkIsValid,
                        viewModel: LinkSectionViewModelFactory.buildForYouTube())
                .transition(.moveAndFade)
        } else if selectedStreamingPlatform == .twitch {
            LinkSection(linkContent: $streamLinkContent,
                        isValid: $streamLinkIsValid,
                        viewModel: LinkSectionViewModelFactory.buildForTwitch())
                .transition(.moveAndFade)
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
    @State var streamLinkIsValid: Bool = false
    @State var streamLinkContent: String = ""
    
    var body: some View {
        StreamSection(hasStreaming: $hasStreaming, selectedStreamingPlatform: $selected, streamLinkIsValid: $streamLinkIsValid, streamLinkContent: $streamLinkContent)
    }
}
