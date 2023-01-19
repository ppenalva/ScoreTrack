//
//  RoundPlayerStore.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 18/1/23.
//

import Foundation
import SwiftUI

class RoundPlayerStore: ObservableObject {
    @Published var roundPlayers: [RoundPlayer] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("roundPlayers.data")
    }
    static func load(completion: @escaping (Result<[RoundPlayer], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let roundPlayers = try JSONDecoder().decode([RoundPlayer].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(roundPlayers))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    static func save(roundPlayers: [RoundPlayer], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(roundPlayers)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(roundPlayers.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
