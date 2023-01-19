//
//  MatchView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct MatchView: View {
    
    @Binding var match: MatchInfo
    @Binding var rounds: [Round]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(match.name)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(match.players.count)", systemImage: "person.3")
                    .padding(.trailing, 20)
                Spacer()
                Label("\(rounds.filter {( $0.match == match.name)}.count)", systemImage: "r.circle")
                    
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(match.theme.accentColor)
    }
}
