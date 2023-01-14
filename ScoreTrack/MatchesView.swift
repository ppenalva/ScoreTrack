//
//  MatchesView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct MatchesView: View {
    let matches: [MatchInfo]
    
    var body: some View {
        List {
            ForEach(matches) { match in
                MatchView(match: match)
                    .listRowBackground(match.theme.mainColor)
            }
            
            
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView(matches: MatchInfo.sampleData)
    }
}
