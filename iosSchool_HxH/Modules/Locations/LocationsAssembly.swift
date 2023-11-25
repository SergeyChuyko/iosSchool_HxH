//
//  LocationsAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

protocol LocationsAssembly {
    func locationsVC() -> LocationsViewController
    func locationsDataProvider() -> LocationsDataProvider
    func locationsCoordinator() -> LocationsCoordinator
}

extension Assembly: LocationsAssembly {
    func locationsVC() -> LocationsViewController {
        .init(locationsDataProvider: locationsDataProvider())
    }

    func locationsDataProvider() -> LocationsDataProvider {
        LocationsDataProviderImp(locationApiClient: apiClient)
    }

    func locationsCoordinator() -> LocationsCoordinator {
        LocationsCoordinator(assembly: self, context: .init())
    }
}
