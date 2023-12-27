//
//  PersonDataProvider.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import Foundation

protocol PersonDataProvider {
    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

class PersonDataProviderImp: PersonDataProvider {
    private let episodeApiClient: PersonApiClient

    init(episodeApiClient: PersonApiClient) {
        self.episodeApiClient = episodeApiClient
    }

    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        episodeApiClient.episode(url: url, onRequestCompleted: onRequestCompleted)
    }
}
