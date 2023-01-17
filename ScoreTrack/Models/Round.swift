//
//  Round.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 16/1/23.
//

import Foundation

    struct Round: Identifiable, Codable {
        let id: UUID
        var name: String
        var roundPlayers: [RoundPlayer] = []

        init(id : UUID = UUID(), name: String, roundPlayers: [RoundPlayer]) {
            self.id = id
            self.name = name
        }
    }

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
