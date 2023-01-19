//
//  RoundStore.swift
//  ScoreTrack
//
//  Created by Pablo Penalva on 18/1/23.
//

import Foundation
import SwiftUI

class RoundStore: ObservableObject {
    @Published var rounds: [Round] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("rounds.data")
    }
    static func load(completion: @escaping (Result<[Round], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let rounds = try JSONDecoder().decode([Round].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(rounds))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    static func save(rounds: [Round], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(rounds)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(rounds.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
