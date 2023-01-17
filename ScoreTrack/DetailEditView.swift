//
//  DetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var data: MatchInfo.Data
    @Binding var match : MatchInfo
    
    
    @State private var newPlayerName = ""
    @State private var newRoundName = ""
    
    @State private var newRoundPlayers: [RoundPlayer] = []
    @State private var newRoundPlayer = RoundPlayer(name: "", score: 0.0)
    @State private var newRound = Round(name: "", roundPlayers: [])
    
    @State private var isPresentingRoundDetailNewView = false
    @State private var isPresentingRoundDetailEditView = false
    
    var body: some View {
        
        Form {
            Section(header: Text("Match Info")) {
                TextField("Name", text: $data.name)
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Players")) {
                ForEach(data.players) { player in
                    Text(player.name)
                }
                .onDelete { indices in
                    data.players.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Player", text: $newPlayerName)
                    Button(action: {
                        withAnimation {
                            let player = MatchInfo.Player(name: newPlayerName)
                            data.players.append(player)
                            newPlayerName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newPlayerName.isEmpty)
                }
            }
            Section(header: Text("Rounds")) {
                ForEach($match.rounds) { $round in
                    NavigationLink(destination: RoundDetailEditView(round: $round)) {
                        Text(round.name)
                    }
                    
                }
                .onDelete { indices in
                    match.rounds.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Round", text: $newRoundName)
                    Button(action: {
                        withAnimation {
            
                            for player in match.players {
                                newRoundPlayer.name = player.name
                                newRoundPlayer.score = 1.0
            
                                newRoundPlayers.insert ( newRoundPlayer, at: 0)
                                
                                newRoundPlayer = RoundPlayer(name: "", score: 0.0)
                            }
                            newRound.name = newRoundName
                            newRound.roundPlayers = newRoundPlayers
                            
                            isPresentingRoundDetailNewView = true
                        
                            newRoundName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newRoundName.isEmpty)
                }
            }
            
        }
        .sheet(isPresented:$isPresentingRoundDetailNewView) {
            NavigationView {
                RoundDetailNewView (newRound: $newRound)
                    .navigationTitle(newRound.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingRoundDetailNewView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingRoundDetailNewView = false
                                match.rounds.insert (newRound, at: 0)
                                match.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}
