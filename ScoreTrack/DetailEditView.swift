//
//  DetailEditView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: MatchInfo.Data
    @State private var newPlayerName = ""
    @State private var newRoundName = ""

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
                ForEach(data.rounds) { round in
                    Text(round.name)
                }
                .onDelete { indices in
                    data.rounds.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Round", text: $newRoundName)
                    Button(action: {
                        withAnimation {
                            let round = MatchInfo.Round(name: newRoundName, roundPlayers: [" "])
                            data.rounds.append(round)
                            newRoundName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newRoundName.isEmpty)
                }
            }
            
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(MatchInfo.sampleData[0].data))
    }
}
