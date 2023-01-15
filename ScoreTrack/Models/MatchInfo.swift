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
    var rounds: [Round]
    var theme: Theme
    
    init(id: UUID = UUID(), name: String, players: [String], rounds: [String], theme: Theme) {
        self.id = id
        self.name = name
        self.players = players.map { Player(name: $0)}
        self.rounds = rounds.map { Round(name: $0, roundPlayers: [])}
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
    
    struct Round: Identifiable, Codable {
        let id: UUID
        var name: String
        var roundPlayers: [RoundPlayer]
        
        init(id : UUID = UUID(), name: String, roundPlayers: [String]) {
            self.id = id
            self.name = name
            self.roundPlayers = [RoundPlayer (name: " ", score: 0.0)]
        }
    }
    
    struct Data {
        var name: String = ""
        var players: [Player] = []
        var rounds: [Round] = []
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(name: name, players: players, rounds: rounds, theme: theme)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        players = data.players
        rounds = data.rounds
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        name = data.name
        players = data.players
        rounds = data.rounds
        theme = data.theme
    }
}

extension MatchInfo.Round {
    struct RoundPlayer: Identifiable, Codable {
        let id: UUID
        var name: String
        var score: Double
        
        init(id: UUID = UUID(), name: String, score: Double) {
            self.id = id
            self.name = name
            self.score = score
        }
    }
}


extension MatchInfo {
    static let sampleData: [MatchInfo] =
    [
        MatchInfo( name: "Partida 1", players: ["Pablo","Rafael","Alberto"], rounds: ["Ronda 1","Ronda 2"], theme: .yellow),
        MatchInfo( name: "Partida 2", players: ["Pablo","Salvador","Alberto"], rounds: ["Ronda 1","Ronda 2"], theme: .orange),
        MatchInfo( name: "Partida 3", players: ["Pablo","Carlos","Patricia", "Eugenia"], rounds: ["Ronda 1","Ronda 2"], theme: .poppy)
    ]
}
