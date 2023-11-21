//
//  LocationsApiClient.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

protocol LocationsApiClient {
    func getLocations(
        onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void
    )
}

extension ApiClient: LocationsApiClient {
    func getLocations(
        onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.locationURL
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case .success(let locations):
                onRequestCompleted(locations, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
