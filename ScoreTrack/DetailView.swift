//
//  DetailView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var match:MatchInfo
    
   
    @State private var data = MatchInfo.Data()
    @State private var isPresentingEditView = false
    
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
                        // total de partida por jugador
                    }
                }
            }
            Section(header: Text("Rounds")) {
                ForEach($match.rounds) { $round in
                    
                    NavigationLink(destination: RoundDetailView(round: $round)) {
                        HStack {
                            Label(round.name, systemImage: "r.circle")
                        }
                    }
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = match.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView (data: $data, match: $match)
                    .navigationTitle(match.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                match.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}
