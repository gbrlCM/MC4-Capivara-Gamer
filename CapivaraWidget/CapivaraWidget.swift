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
    let authService: AutheticationService
    
    init(repository: EventRepositoryProtocol, authService: AutheticationService) {
        self.repository = repository
        self.authService = authService
    }
    
    func placeholder(in context: Context) -> CapivaraEntry {
        var event = EventMock.event
        event.name = "Evento"
        return CapivaraEntry(date: Date(), event: event)
        
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CapivaraEntry) -> ()) {
        Task {
            do {
                try await authService.login()
                guard let user = authService.userPublisher.value else {
                    completion(CapivaraEntry(date: Date(), event: EventMock.event))
                    return
                }
                
                let events = try await repository.fetchUserEvents(of: user)
                let image = await downloadImage(urlString: events[0].coverUrl ?? "")
                
                completion(CapivaraEntry(date: events[0].date, event: events[0], image: image))
                
            } catch {
                completion(CapivaraEntry(date: Date(), event: EventMock.event))
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CapivaraEntry>) -> ()) {
        Task {
            do {
                try await authService.login()
                guard let user = authService.userPublisher.value else {
                    var event = EventMock.event
                    event.name = "Erro de autenticação"
                    let entry = CapivaraEntry(date: Date(), event: event)
                    completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))))
                    return
                }
                
                let events = try await repository.fetchUserEvents(of: user)
                
                if events.isEmpty {
                    var event = EventMock.event
                    event.name = "Cadastre-se em um evento"
                    let entry = CapivaraEntry(date: Date(), event: event)
                    completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))))
                } else {
                    
                    let image = await downloadImage(urlString: events[0].coverUrl ?? "")
                    let entry = CapivaraEntry(date: events[0].date, event: events[0], image: image)
                    completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(21600))))
                }
                
            } catch {
                var event = EventMock.event
                event.name = "Erro de autenticação"
                let entry = CapivaraEntry(date: Date(), event: event)
                completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))))
            }
        }
    }
    
    func downloadImage(urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let uiImage = UIImage(data: data)
            return uiImage
        } catch {
            return nil
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
    
    let repository: EventRepositoryProtocol = EventRepository()
    let userMock: UserRepositoryProtocol = UserRepository()
    
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(repository: repository,
                                                           authService: AutheticationService(repository: userMock,
                                                                                             keychainService: KeychainService()))) { entry in
            CapivaraControlWidget(entry: entry)
        }
        .configurationDisplayName("Próximos eventos")
        .description("Acesse rapidamente as suas próximas partidas.")
        .supportedFamilies([.systemSmall, .systemMedium])
        
    }
}

struct CapivaraWidget_Previews: PreviewProvider {
    static var previews: some View {
        CapivaraWidgetEntryView(entry: CapivaraEntry(date: Date(), event: EventMock.event))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
