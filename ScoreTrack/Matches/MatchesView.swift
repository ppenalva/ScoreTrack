//
//  MatchesView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct MatchesView: View {
    
    @Binding var matches: [MatchInfo]
    @Binding var rounds: [Round]
    @Binding var roundPlayers: [RoundPlayer]
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var isPresentingNewMatchView = false
    
    @State private var newMatchData = MatchInfo.Data()
    
   @State var match: MatchInfo = MatchInfo(data: MatchInfo.Data())
    
    
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($matches) { $match1 in
                    NavigationLink(destination: DetailView(match: $match1, rounds: $rounds, roundPlayers: $roundPlayers))
                    { MatchView(match: $match1, rounds: $rounds)}
                       
                
                    .listRowBackground(match1.theme.mainColor)
            }
            
            .onDelete(perform: deleteMatch)
        }
        .navigationTitle("Matches")
        .toolbar {
            Button(action: {
                newMatchData = MatchInfo.Data()
                isPresentingNewMatchView = true}) {
                    Image(systemName: "plus")
                }
        }
        .sheet(isPresented: $isPresentingNewMatchView) {
            NavigationView {
                DetailEditView( dataMatch: $newMatchData, rounds: $rounds, roundPlayers: $roundPlayers, match: $match)
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
    func deleteMatch( at indexSet: IndexSet) {
        for index in indexSet {
            let item = matches[index]
            matches.removeAll { $0.name == item.name}
            rounds.removeAll { $0.match == item.name}
            roundPlayers.removeAll {$0.match == item.name}
            
        }
    }
}
