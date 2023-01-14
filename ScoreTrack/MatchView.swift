//
//  MatchView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct MatchView: View {
    let match: MatchInfo
    var body: some View {
        VStack(alignment: .leading) {
            Text(match.name)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(match.players.count)", systemImage: "person.3")
                    .padding(.trailing, 20)
                Spacer()
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(match.theme.accentColor)
    }
}

struct MatchView_Previews: PreviewProvider {
    static var match = MatchInfo.sampleData[0]
    static var previews: some View {
        MatchView(match: match)
            .background(match.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
