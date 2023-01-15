//
//  RoundDetailView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 15/1/23.
//

import SwiftUI

struct RoundDetailView: View {
    
    @Binding var round: MatchInfo.Round
    
    var body: some View {
        List {
            Text("\(round.name)")
            ForEach(round.roundPlayers) { player in
                HStack {
                    Text("\(player.name)")
                    Spacer()
                    Text("\(player.score)")
                }
            }
        }
    }
}
