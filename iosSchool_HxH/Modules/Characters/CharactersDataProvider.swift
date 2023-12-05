//
//  CharactersDataProvider.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

protocol CharactersDataProvider {
    func getCharacter(
        id: Int,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void)

}

class CharactersDataProviderImp: CharactersDataProvider {
    private let characterApiClient: CharacterApiClient

    init(characterApiClient: CharacterApiClient) {
        self.characterApiClient = characterApiClient
    }

    func getCharacter(id: Int, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        characterApiClient.getCharacter(id: id, onRequestCompleted: onRequestCompleted)
    }
    
    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        characterApiClient.character(url: url, onRequestCompleted: onRequestCompleted)
    }
}

