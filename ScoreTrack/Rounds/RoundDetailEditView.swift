//
//  RoundDetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 15/1/23.
//

import SwiftUI

struct RoundDetailEditView: View {
    
    @Binding var round: Round
    @Binding var roundPlayer: [RoundPlayer]
    
    var body: some View {
        List {
            
            ForEach($roundPlayer) { $roundPlayer in
                if( roundPlayer.round == round.name && roundPlayer.match == round.match) {
                    HStack {
                        Text(roundPlayer.name)
                        Spacer()
                        TextField("", value: $roundPlayer.score, format: .number)
                    }
                }
            }
       }
        .navigationTitle($round.name)
    }
}
