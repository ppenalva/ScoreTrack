//
//  ScoreTrackApp.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

@main
struct ScoreTrackApp: App {
    @StateObject private var store = MatchStore()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MatchesView(matches: $store.matches) {
                    MatchStore.save(matches: store.matches) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear {
                MatchStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let matches):
                        store.matches = matches
                    }
                }
            }
        }
    }
}
