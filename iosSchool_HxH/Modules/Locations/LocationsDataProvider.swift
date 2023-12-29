//
//  LocationsDataProvider.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

protocol LocationsDataProvider {
    func getLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationsDataProviderImp: LocationsDataProvider {
    private let locationApiClient: LocationsApiClient

    init(locationApiClient: LocationsApiClient) {
        self.locationApiClient = locationApiClient
    }

    func getLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        locationApiClient.getLocations(onRequestCompleted: onRequestCompleted)
    }
}
