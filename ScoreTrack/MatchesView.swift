//
//  MatchesView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct MatchesView: View {
    @Binding var matches: [MatchInfo]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewMatchView = false
    @State private var newMatchData = MatchInfo.Data()
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($matches) { $match in
                NavigationLink(destination: DetailView(match: $match)) {                MatchView(match: match)
                }
                .listRowBackground(match.theme.mainColor)
            }
        }
        .navigationTitle("Matches")
        .toolbar {
            Button(action: {isPresentingNewMatchView = true}) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewMatchView) {
            NavigationView {
                DetailEditView(data: $newMatchData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewMatchView = false
                                newMatchData = MatchInfo.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newMatch = MatchInfo(data: newMatchData)
                                matches.append(newMatch)
                                isPresentingNewMatchView = false
                                newMatchData = MatchInfo.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MatchesView(matches: .constant(MatchInfo.sampleData),saveAction: {})
        }
    }
}
