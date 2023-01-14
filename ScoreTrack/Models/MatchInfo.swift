//
//  MachInfo.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import Foundation

struct MatchInfo: Identifiable {
    let id: UUID
    var name: String
    var players: [String]
    var theme: Theme
    
    init(id: UUID, name: String, players: [String], theme: Theme) {
        self.id = id
        self.name = name
        self.players = players
        self.theme = theme
    }
}

extension MatchInfo {
    static let sampleData: [MatchInfo] =
    [
        MatchInfo(id: UUID(), name: "Partida 1", players: ["Pablo","Rafael","Alberto"], theme: .yellow),
        MatchInfo(id: UUID(), name: "Partida 2", players: ["Pablo","Salvador","Alberto"], theme: .orange),
        MatchInfo(id: UUID(), name: "Partida 3", players: ["Pablo","Carlos","Patricia", "Eugenia"], theme: .poppy)
    ]
}
