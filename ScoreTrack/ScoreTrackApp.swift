//
//  ScoreTrackApp.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 14/1/23.
//

import SwiftUI

@main
struct ScoreTrackApp: App {
  
    @StateObject private var storeMatch = MatchStore()
    @StateObject private var storeRound = RoundStore()
    @StateObject private var storeRoundPlayer = RoundPlayerStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MatchesView(matches: $storeMatch.matches, rounds: $storeRound.rounds, roundPlayers: $storeRoundPlayer.roundPlayers) {
                    MatchStore.save(matches: storeMatch.matches) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                    RoundStore.save(rounds: storeRound.rounds) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                    RoundPlayerStore.save(roundPlayers: storeRoundPlayer.roundPlayers) { result in
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
                        storeMatch.matches = matches
                    }
                }
                RoundStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let rounds):
                        storeRound.rounds = rounds
                    }
                }
                RoundPlayerStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let roundPlayers):
                        storeRoundPlayer.roundPlayers = roundPlayers
                    }
                }
            }
        }
    }
}
