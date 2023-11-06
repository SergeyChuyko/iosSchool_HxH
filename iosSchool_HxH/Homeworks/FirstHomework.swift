//
//  firstHomework.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.10.2023.
//

import Foundation

protocol CharacterGeneratorProtocol: AnyObject {
    func generateSomeCharacter() -> Character
}

struct Location {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

struct LocationsList {
    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [Location]
}

class Character {
    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }

    enum Status: String, CaseIterable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    init(
        id: Int,
        name: String,
        species: String,
        image: String,
        url: String,
        episode: [String],
        gender: Gender,
        status: Status
    ) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }
}

class CharacterGenerator: CharacterGeneratorProtocol {
    func generateSomeCharacter() -> Character {
        let idCharacter = Int.random(in: 1...99)
        return Character(
            id: idCharacter,
            name: "Character: \(idCharacter)",
            species: "Species: \(idCharacter)",
            image: "\(idCharacter).JPEG",
            url: "CharacterURL: https://www.\(idCharacter).com",
            episode: ["Episode number: \(idCharacter)"],
            gender: Character.Gender.allCases.randomElement() ?? .unknown,
            status: Character.Status.allCases.randomElement() ?? .unknown
        )
    }

    private func generateCharacterName() -> String {
        return "Character \(Int.random(in: 0...99))"
    }

    func generateNameOne(completion: (String) -> Void) {
        let characterName = generateCharacterName()
        completion(characterName)
    }

    func generateNameTwo(completion: () -> (String)) {
        let characterName = generateCharacterName()
        print(characterName)
    }

    func generateNameTree() -> ((String) -> Void) {
        let characterName = generateCharacterName()
        return { name in
            print("Generated name: \(characterName), nickname: \(name)")
        }
    }

    func generateNameFour() -> (() -> String) {
        let characterName = generateCharacterName()
        return { characterName }
    }

}
