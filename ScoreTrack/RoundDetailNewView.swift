//
//  RoundDetailNewView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 16/1/23.
//

import SwiftUI

struct RoundDetailNewView: View {
    
    @Binding var newRound: Round
    
    
    var body: some View {
        List {
            
            ForEach($newRound.roundPlayers) { $player in
                HStack {
                    Text(player.name)
                    Spacer()
                    TextField("", value: $player.score, format: .number)
                }
            }
        }
        .navigationTitle($newRound.name)
    }
}
