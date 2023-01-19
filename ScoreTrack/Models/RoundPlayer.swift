//
//  RoundPlayer.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 18/1/23.
//

import Foundation

struct RoundPlayer: Identifiable, Codable {
    
    let id: UUID
    var match: String
    var round: String
    var name: String
    var score: Double
    
    init(id : UUID = UUID(), match: String, round: String,name: String, score: Double) {
        self.id = id
        self.match = match
        self.round = round
        self.name = name
        self.score = score
    }
}

extension RoundPlayer {
    
    struct Data : Identifiable {
        var id: UUID
        var match: String = ""
        var round: String = ""
        var name: String = ""
        var score: Double = 0.0
    }
    var data: Data { Data(
        id: UUID(),
        match: match,
        round: round,
        name: name,
        score: score
    )
    }
    mutating func update ( from data: Data) {
        match = data.match
        round = data.round
        name = data.name
        score = data.score
    }
    init(data: Data) {
        id = UUID()
        match = data.match
        round = data.round
        name = data.name
        score = data.score
    }
}
extension RoundPlayer {
    static let sampleData: [RoundPlayer] =
    [
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Pablo",
                    score: 10.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Rafael",
                    score: 8.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Alberto",
                    score: 12.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 2",
                    name: "Pablo",
                    score: 7.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Rafael",
                    score: 10.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Alberto",
                    score: 6.0),
        RoundPlayer(match: "Partida 2",
                    round: "Ronda 1",
                    name: "Juan",
                    score: 2.0),
        RoundPlayer(match: "Partida 1",
                    round: "Ronda 1",
                    name: "Jose",
                    score: 5.0)
    ]
}
