//
//  DetailView.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

struct DetailView: View {
    let match: MatchInfo
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
                    Label(player.name, systemImage: "person")
                }
           }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(match: MatchInfo.sampleData[0])
        }
    }
}
