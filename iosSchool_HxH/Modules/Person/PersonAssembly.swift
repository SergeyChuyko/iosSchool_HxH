//
//  PersonAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import Foundation

protocol PersonAssembly {
    func personVC(data: CharactersCellData) -> PersonViewController<PersonViewImp>
    func personDataProvider() -> PersonDataProvider
    func personCoordinator(data: CharactersCellData) -> PersonCoordinator
}

extension Assembly: PersonAssembly {
    func personVC(data: CharactersCellData) -> PersonViewController<PersonViewImp> {
        .init(dataProvider: personDataProvider(), data: data, imageService: imageService)
    }

    func personDataProvider() -> PersonDataProvider {
        PersonDataProviderImp(episodeApiClient: apiClient)
    }

    func personCoordinator(data: CharactersCellData) -> PersonCoordinator {
        PersonCoordinator(assembly: self, context: .init(data: data))
    }
}
