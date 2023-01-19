//
//  DetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var dataMatch: MatchInfo.Data
    
    @Binding var rounds: [Round]
    @Binding var roundPlayers: [RoundPlayer]
    
    @Binding var match : MatchInfo
    
    
    @State private var newPlayerName = ""
    
    @State private var newMatchData = MatchInfo.Data()
    
    @State private var newRoundData = Round.Data()
    @State private var newRoundPlayerData = RoundPlayer.Data(id:UUID())
    @State private var  newRoundPlayersData = [RoundPlayer.Data(id: UUID())]
    
    var body: some View {
        
        List {
            Section(header: Text("Match Info")) {
                TextField("Name", text: $dataMatch.name)
                ThemePicker(selection: $dataMatch.theme)
            }
            Section(header: Text("Players")) {
                ForEach(dataMatch.players) { player in
                    Text(player.name)
                }
                .onDelete { indices in
                    dataMatch.players.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Player", text: $newPlayerName)
                    Button(action: {
                        withAnimation {
                            let player = MatchInfo.Player(name: newPlayerName)
                            dataMatch.players.append(player)
                            newPlayerName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newPlayerName.isEmpty)
                }
            }
            Section(header: Text("Rounds")) {
                
                ForEach(rounds) { round in
                    if( round.match == match.name) {
  //                      newRoundData = dataRound
  //                      newRoundPlayersData =
                        
  //                      NavigationLink(destination: RoundDetailEditView(dataRound: $round, dataRoundPlayer: $roundPlayers))
  //                      {
                        Text("\(round.name)")
  //                      }
                    }
                }
                .onDelete { indices in
                    rounds.remove(atOffsets: indices)
                }
            }
        }
   }
}
