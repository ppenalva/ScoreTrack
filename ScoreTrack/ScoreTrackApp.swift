//
//  ScoreTrackApp.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

@main
struct ScoreTrackApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MatchesView(matches: MatchInfo.sampleData)
            }
        }
    }
}
