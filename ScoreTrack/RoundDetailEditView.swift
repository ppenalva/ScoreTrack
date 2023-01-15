//
//  RoundDetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 15/1/23.
//

import SwiftUI

struct RoundDetailEditView: View {
    
    @Binding var data: MatchInfo.Data
    
    @State private var score: Double = 0.0
    
    var body: some View {
        List {
            TextField("Round Name", text: $data.name)
            ForEach(data.players) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    TextField("Score", value: $score, format: .number)
                }
            }
        }
    }
}
