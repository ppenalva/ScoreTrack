//
//  RoundDetailView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 15/1/23.
//

import SwiftUI

struct RoundDetailView: View {
    
   @Binding var round : Round
    @Binding var roundPlayers: [RoundPlayer]
    
    var body: some View {

        List {

           ForEach(roundPlayers) { roundPlayer in
               if( roundPlayer.round == round.name && roundPlayer.match == round.match) {
                   HStack {
                       Text("\(roundPlayer.name)")
                       Spacer()
                       Text(String(format: "%.2f",roundPlayer.score))
                   }
               }
            }
        }
        .navigationTitle($round.name)
    }
}
