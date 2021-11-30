//
//  Presentable.swift
//  Capivara
//
//  Created by Gabriel Ferreira de Carvalho on 29/11/21.
//

import SwiftUI

protocol Presentable {
    associatedtype V: View
    var label: V { get }
}

extension TournamentFormat: Presentable {
    var label: some View {
        let text: Text
        switch self {
        case .roundRobin:
            text = Text("Round Robin")
        case .singleElimination:
            text = Text("Single Elimination")
        case .doubleElimination:
            text = Text("Double Elimination")
        case .multiLevel:
            text = Text("Multiple Levels")
        case .extended:
            text = Text("Extended")
        case .groupStageAndTournament:
            text = Text("Group Stage And Tournament")
        case .points:
            text = Text("Points")
        case .singleMatch:
            text = Text("Single Match")
        }
        return text.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}

extension MatchFormat: Presentable {
    var label: some View {
        let label: Label<Text, Image>
        switch self {
        case .bestOfOne:
            label = Label("Melhor de uma", systemImage: "1.circle.fill")
        case .bestOfThree:
            label = Label("Melhor de três", systemImage: "3.circle.fill")
        case .bestOfFive:
            label = Label("Melhor de cinco", systemImage: "5.circle.fill")
        case .bestOfSeven:
            label = Label("Melhor de sete", systemImage: "7.circle.fill")
        }
        return label.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}

extension EventType: Presentable {
    var label: some View {
        let label: Label<Text, Image>
        switch self {
        case .championship:
            label = Label("Campeonato", systemImage: "person.3.fill")
        case .training:
            label = Label("Treino", systemImage: "brain.head.profile")
        case .forFun:
            label = Label("For fun", systemImage: "face.smilling.fill")
        case .streaming:
            label = Label("Streaming", systemImage: "person.wave.2.fill")
        }
        return label.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}

extension ContactType: Presentable {
    var label: some View {
        let label: Label<Text, Image>
        switch self {
        case .discord:
            label = Label("Discord", image: "discord.logo")
        case .email:
            label = Label("Email", systemImage: "envelope.fill")
        case .inGameVoice:
            label = Label("Voz in Game", systemImage: "music.mic.circle.fill")
        case .chatOnly:
            label = Label("Apenas o chat", systemImage: "text.bubble.fill")
        }
        return label.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}

extension GameType: Presentable {
    var label: some View {
        let label: Label<Text, Image>
        switch self {
        case .mobile:
            label = Label("Mobile", systemImage: "candybarphone")
        case .pc:
            label = Label("Computer", systemImage: "laptopcomputer")
        case .xbox:
            label = Label("Xbox", systemImage: "logo.xbox")
        case .playstation:
            label = Label("Playstation", systemImage: "logo.playstation")
        }
        return label.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}

extension AddressType: Presentable {
    var label: some View {
        let label: Label<Text, Image>
        switch self {
        case .online:
            label = Label("Online", systemImage: "network")
        case .inPerson:
            label = Label("Presencial", systemImage: "building.2.fill")
        }
        return label.font(.headline.weight(.semibold)).foregroundColor(ColorPalette.primaryText)
    }
}
