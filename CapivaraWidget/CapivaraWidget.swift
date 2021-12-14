//
//  CapivaraWidget.swift
//  CapivaraWidget
//
//  Created by Thallis Sousa on 09/12/21.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    let repository: EventRepositoryProtocol
    init(repository: EventRepositoryProtocol) {
        self.repository = repository
    }
    
    func placeholder(in context: Context) -> CapivaraEntry {
        CapivaraEntry(date: Date(), event: EventMock.event)
        
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CapivaraEntry) -> ()) {
        Task {
            do {
                let events = try await repository.fetchAllEvents()
                completion(CapivaraEntry(date: Date(), event: events[0]))
            } catch {
                completion(CapivaraEntry(date: Date(), event: EventMock.event))
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CapivaraEntry>) -> ()) {
        Task {
            do {
                let events = try await repository.fetchAllEvents()
                let timeline = Timeline(entries: events.map{CapivaraEntry(date: Date(), event: $0)}, policy: .after(Date().addingTimeInterval(21600)))
                completion(timeline)
            } catch {
                
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CapivaraWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        CapivaraControlWidget(entry: CapivaraEntry.init(date: Date(), event: EventMock.event))
        
    }
}

@main
struct CapivaraWidget: Widget {
    let kind: String = "Capy"
    
    @MainActor
    let repository: EventRepositoryMock = EventRepositoryMock()
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(repository: repository)) { entry in
            CapivaraWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Próximos eventos")
        .description("Acesse rapidamente as suas próximas partidas.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        
    }
}

struct CapivaraWidget_Previews: PreviewProvider {
    static var previews: some View {
        CapivaraWidgetEntryView(entry: CapivaraEntry(date: Date(), event: EventMock.event))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
