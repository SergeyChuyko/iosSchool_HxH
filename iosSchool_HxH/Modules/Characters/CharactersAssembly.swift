//
//  CharactersAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

protocol CharactersAssembly {
    func charactersVC(data: LocationsCellData) -> CharactersViewController
    func charactersDataProvider() -> CharactersDataProvider
    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator
}

extension Assembly: CharactersAssembly {
    func charactersVC(data: LocationsCellData) -> CharactersViewController {
        .init(charactersDataProvider: charactersDataProvider(), data: data, imageSerivce: imageService )
    }

    func charactersDataProvider() -> CharactersDataProvider {
        CharactersDataProviderImp(characterApiClient: apiClient)
    }

    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator {
        CharactersCoordinator(assembly: self, context: .init(data: data))
    }

}
