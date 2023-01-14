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
                NavigationLink(destination: DetailView(match: match)) {                MatchView(match: match)
                }
                .listRowBackground(match.theme.mainColor)
            }
        }
        .navigationTitle("Matches")
        .toolbar {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MatchesView(matches: MatchInfo.sampleData)
        }
    }
}
