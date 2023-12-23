//
//  PersonApiClient.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import Foundation

protocol EpisodeApiClient {
    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

extension ApiClient: EpisodeApiClient {
    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        performRequest(url: url, data: nil, method: .get) { (result: Result<Episode, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
