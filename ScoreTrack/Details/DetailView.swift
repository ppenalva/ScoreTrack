//
//  DetailView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var match: MatchInfo
    
    @Binding var rounds: [Round]
    @Binding var roundPlayers: [RoundPlayer]
    
    @State private var dataMatch = MatchInfo.Data()
    @State private var dataRond = Round.Data()
    @State private var dataRoundPlayer = RoundPlayer.Data(id: UUID())
    
    
    @State private var isPresentingNewRound = false
    
    @State private var isPresentingEditView = false
    
    @State private var newRoundData = Round.Data()
    @State private var newRoundPlayerData = RoundPlayer.Data(id:UUID())
    @State private var  newRoundPlayersData = [RoundPlayer.Data(id: UUID())]
    
    func calculatePlayerScore(player: String) -> Double {
        var total = 0.0
        for (roundPlayer) in roundPlayers {
            if (roundPlayer.name == player && roundPlayer.match == match.name)
            {
                total += roundPlayer.score
            }
        }
        return total
    }
    
    var body: some View {
        
        List {
            Section(header: Text(" Match Info")) {
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(match.theme.name)
                        .padding(4)
                        .foregroundColor(match.theme.accentColor)
                        .background(match.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            Section(header: Text("Players")) {
                ForEach(match.players) { player in
                    HStack {
                        Label(player.name, systemImage: "person")
                        Spacer()
                        let total1 = calculatePlayerScore(player: player.name)
                        Text(String(format: "%.2f",total1))
                    }
                }
            }
            Button("New Round") {
                let maxRoundName = (rounds.filter { round in round.match == match.name}).max()?.name
                let number =  Int(maxRoundName?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? "00")
                let newNumber = number! + 1
                let texto = maxRoundName?.components(separatedBy: CharacterSet.decimalDigits).joined()
                let newRoundName = (texto ?? "Round ") + String(newNumber)
                
                newRoundData.match = match.name
                newRoundData.name = newRoundName
                
                newRoundPlayersData.removeAll()
                
                for player in match.players {
                    
                    
                    
                    newRoundPlayerData.match = match.name
                    newRoundPlayerData.round = newRoundName
                    newRoundPlayerData.name = player.name
                    newRoundPlayerData.score = 0.0
                    newRoundPlayersData.append(newRoundPlayerData)
                    newRoundPlayerData = RoundPlayer.Data(id: UUID())
                }
                
                isPresentingNewRound = true
            }
            Section(header: Text("Rounds")) {
                ForEach($rounds) { $round in
                    if( round.match == match.name) {
                        NavigationLink(destination: RoundDetailView(round: $round, roundPlayers: $roundPlayers)) {
                            Text(round.name)
                        }
                    }
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                dataMatch = match.data
            }
        }
        .sheet(isPresented: $isPresentingNewRound) {
            NavigationView {
                RoundDetailEditView( dataRound: $newRoundData, dataRoundPlayer: $newRoundPlayersData)
                    .navigationTitle(match.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                
                                isPresentingNewRound = false
                                newRoundData = Round.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                let newRound = Round(data: newRoundData)
                                rounds.insert(newRound, at: 0)
                                for (newRoundPlayerData) in newRoundPlayersData {
                                    let newRoundPlayer = RoundPlayer(data: newRoundPlayerData)
                                    roundPlayers.append(newRoundPlayer)
                                }
                                
                                isPresentingNewRound = false
                                newRoundData = Round.Data()
                            }
                        }
                    }
            }
        }
        
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView (dataMatch: $dataMatch, rounds: $rounds, roundPlayers: $roundPlayers, match: $match)
                    .navigationTitle(match.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Confirm") {
                                match.update(from:  dataMatch)
                                isPresentingEditView = false
                            }
                        }
                    }
            }
            .navigationTitle(match.name)
        }
    }
}
