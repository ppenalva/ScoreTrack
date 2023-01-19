//
//  RoundDetailNewView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 16/1/23.
//

import SwiftUI

struct RoundDetailNewView: View {
    
    @Binding var dataRound: Round.Data
    @Binding var dataRoundPlayer: [RoundPlayer.Data]
    
    var body: some View {
        List {
            
            ForEach($dataRoundPlayer) { $roundPlayer in
                HStack {
                    Text(roundPlayer.name)
                    Spacer()
                    TextField("", value: $roundPlayer.score, format: .number)
                }
            }
       }
        .navigationTitle($dataRound.name)
    }
}
