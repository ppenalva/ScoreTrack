//
//  MachInfo.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import Foundation

struct MatchInfo: Identifiable, Codable {
    let id: UUID
    var name: String
    var players: [Player]
    var theme: Theme
    
    init(id: UUID = UUID(), name: String, players: [String], theme: Theme) {
        self.id = id
        self.name = name
        self.players = players.map { Player(name: $0)}
        self.theme = theme
    }
}

extension MatchInfo {
    struct Player: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id : UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var name: String = ""
        var players: [Player] = []
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(name: name, players: players, theme: theme)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        players = data.players
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        name = data.name
        players = data.players
        theme = data.theme
    }
}

extension MatchInfo {
    static let sampleData: [MatchInfo] =
    [
        MatchInfo( name: "Partida 1", players: ["Pablo","Rafael","Alberto"], theme: .yellow),
        MatchInfo( name: "Partida 2", players: ["Pablo","Salvador","Alberto"], theme: .orange),
        MatchInfo( name: "Partida 3", players: ["Pablo","Carlos","Patricia", "Eugenia"], theme: .poppy)
    ]
}
