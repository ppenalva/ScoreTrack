//
//  Round.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 16/1/23.
//

import Foundation

struct Round: Identifiable, Codable, Comparable {
    
    let id: UUID
    var match: String
    var name: String
    
    init(id : UUID = UUID(), match: String, name: String ) {
        self.id = id
        self.match = match
        self.name = name
    }
    
    static func < (lhs: Round, rhs: Round) -> Bool {
        lhs.name < rhs.name
    }
    
    
    static func == (lhs: Round, rhs: Round) -> Bool {
        lhs.name == rhs.name
    }
}

extension Round {
    
    struct Data {
        var match: String = ""
        var name: String = ""
    }
    var data: Data { Data(
        match: match,
        name: name
    )
    }
    mutating func update( from data: Data) {
        match = data.match
        name = data.name
    }
    init(data: Data) {
        id = UUID()
        match = data.match
        name = data.name
    }
}

extension Round {
    static let sampleData: [Round] =
    [
        Round( match: "Partida 1",
               name: "Ronda 1"),
        Round( match: "Partida 1",
               name: "Ronda 2"),
        Round( match: "Partida 1",
               name: "Ronda 3"),
        Round( match: "Partida 2",
               name: "Ronda 1"),
        Round( match: "Partida 2",
               name: "Ronda 2")
    ]
}
