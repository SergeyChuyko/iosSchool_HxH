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
        completion(generateCharacterName())
    }

    func generateNameTwo(completion: () -> (String)) {
        print("Character: \(completion())")
    }

    func generateNameTree() -> (String) -> Void {
        {
            print("Generated name: \(self.generateCharacterName()), nickname: \($0)")
        }
    }

    func generateNameFour() -> () -> String {
        generateCharacterName
    }

}
