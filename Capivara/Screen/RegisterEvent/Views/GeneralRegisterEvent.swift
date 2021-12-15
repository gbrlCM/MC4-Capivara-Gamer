//
//  GeneralRegisterEvent.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 06/12/21.
//

import SwiftUI

struct GeneralRegisterEvent: View {
    @EnvironmentObject
    var viewModel: RegisterEventViewModel
    @State private var showSheet = false
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                photoSection
                eventNameSection
                descriptionSection
                dateSection
                timeSection
            }.padding(.horizontal)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(role: .cancel, action: {
                    dismiss()
                }) {
                    Text("Cancelar")
                        .foregroundColor(ColorPalette.danger)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: { GameRegisterEventView() }) {
                    Text("Prox.")
                        .bold()
                        .foregroundColor(ColorPalette.accent)
                }
            }
        }
        .navigationTitle("Geral")
        .foregroundColor(ColorPalette.primaryText)
        .navigationBarTitleColor(ColorPalette.primaryText)
        .backgroundColor(ColorPalette.backgroundColor)
    }
    
    @ViewBuilder
    private var photoSection: some View {
        GeneralRegisterSection(title: "Capa do evento *",
                               subtitle: "Capa que ficará em destaque na pagina do evento.") {
            Button(action: {
                showSheet = true
            }) {
                ZStack {
                    Rectangle().fill(ColorPalette.secondaryBackground)
                        .frame(height: 200)
                        .cornerRadius(10)
                    Image(systemName: "photo")
                        .foregroundColor(ColorPalette.accent)
                        .scaleEffect(2)
                    
                    Image(uiImage: viewModel.coverImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "plus.circle")
                                .foregroundColor(ColorPalette.accent)
                        }
                    }.padding()
                }
            }.sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $viewModel.coverImage)
            }
        }
    }
    
    @ViewBuilder
    private var eventNameSection: some View {
        GeneralRegisterSection(title: "Nome do Evento *",
                               subtitle: "Nome principal que ficará na pagina e no card do evento.") {
            TextField("Venha jogar com a Capivara!", text: $viewModel.name, prompt: nil)
                .foregroundColor(ColorPalette.primaryText)
                .padding(.horizontal,15)
                .padding(10)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
                .colorScheme(.dark)
        }
    }
    
    @ViewBuilder
    private var descriptionSection: some View {
        GeneralRegisterSection(title: "Descrição *",
                               subtitle: "Texto informativo que irá aparecer na tela principal do evento.") {
            TextEditor(text: $viewModel.description)
                .foregroundColor(ColorPalette.primaryText)
                .padding(.horizontal, 15)
                .padding(10)
                .background(ColorPalette.secondaryBackground)
                .cornerRadius(10)
                .frame(height: 200)
                .onAppear { UITextView.appearance().backgroundColor = .clear }
                .colorScheme(.dark)
        }
    }
    
    @ViewBuilder
    private var dateSection: some View {
        GeneralRegisterSection(title: "Data e Horário do Evento *",
                               subtitle: "Quando será o seu evento?") {
            DatePicker("", selection: $viewModel.eventDate)
                .preferredColorScheme(.dark)
                .frame(width: 210)
        }
    }
    
    @ViewBuilder
    private var timeSection: some View {
        GeneralRegisterSection(title: "Timers *",
                               subtitle: "Horário de abertura do lobby, e horário de início da primeira partida.") {
            VStack(alignment: .leading) {
                CapybaraTimePicker(time: $viewModel.lobbyEntranceTimer,
                                   title: "Hora do lobby",
                                   subtitle: "Horario de entrada no lobby e canal de comunicação")
                
                CapybaraTimePicker(time: $viewModel.eventStartTimer,
                                   title: "Hora de inicio",
                                   subtitle: "Horario que começara a primeira partida")
            }
        }
    }
}

struct GeneralRegisterEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralRegisterEvent()
        }.environmentObject(RegisterEventViewModel(repository: GameRepositoryMock(), creator: UserMock.gamerCapibara, isShowing: .constant(true)))
    }
}

struct GeneralRegisterSectionTitle: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3.bold())
                    .foregroundColor(ColorPalette.primaryText)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(ColorPalette.secondaryText)
            }
            Spacer()
        }
    }
}

struct GeneralRegisterSection<Content: View>: View {
    var title: String
    var subtitle: String
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            GeneralRegisterSectionTitle(title: title, subtitle: subtitle)
            content()
        }.padding(.top)
    }
    
}

struct CapybaraTimePicker: View {
    @Binding
    var time: Date
    var title: String
    var subtitle: String
    
    var body: some View {
        DatePicker(selection: $time, displayedComponents: .hourAndMinute) {
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(ColorPalette.primaryText)
                    .font(.headline.bold())
                Text(subtitle)
                    .foregroundColor(ColorPalette.secondaryText)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(ColorPalette.secondaryBackground)
        .cornerRadius(10)
    }
}
