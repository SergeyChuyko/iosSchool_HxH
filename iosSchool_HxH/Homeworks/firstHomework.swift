//
//  firstHomework.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.10.2023.
//

import Foundation

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
    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status
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

class CharacterGenerator {
    func generateSomeCharacter() -> Character {
        let idCharacter = Int.random(in: 1...99)
        let name = "Character: \(idCharacter)"
        let species = "Species: \(idCharacter)"
        let image = "\(idCharacter).JPEG"
        let url = "CharacterURL: https://www.\(idCharacter).com"
        let episode = ["Episode number: \(idCharacter)"]
        let gender = Character.Gender.allCases.randomElement() ?? .unknown
        let status = Character.Status.allCases.randomElement() ?? .unknown
        return Character(
            id: idCharacter,
            name: name,
            species: species,
            image: image,
            url: url,
            episode: episode,
            gender: gender,
            status: status
        )
    }
}
