//
//  RoundDetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 15/1/23.
//

import SwiftUI

struct RoundDetailEditView: View {
    
    @Binding var round: Round
    
    @State private var score: Double = 0.0
    
    var body: some View {
        List {
            
            ForEach(round.roundPlayers) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    TextField("Score", value: $score, format: .number)
                }
            }
        }
        .navigationTitle($round.name)
    }
}
