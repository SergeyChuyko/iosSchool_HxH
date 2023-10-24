//
//  firstHomework.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.10.2023.
//

import Foundation
struct Location {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents = [String]()
}
struct LocationsList {
    let info: Info
    let results: [Location]
}
struct Info {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
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
    init(id: Int,
         name: String,
         species: String,
         image: String,
         url: String,
         episode: [String],
         gender: Gender,
         status: Status) {
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
enum Gender: String, CaseIterable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "Unknown"
}
enum Status: String, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}
class CharacterGenerator {
    func generateSomeCharacter() -> Character {
        let idCharacter = Int.random(in: 1...99)
        let name = "Character: \(idCharacter)"
        let species = "Species: \(idCharacter)"
        let image = "\(idCharacter).JPEG"
        let url = "CharacterURL: https://www.\(idCharacter).com"
        let episode = ["Episode number: \(idCharacter)"]
        let gender = Gender.allCases.randomElement() ?? .unknown
        let status = Status.allCases.randomElement() ?? .unknown
        return Character(id: idCharacter,
                         name: name,
                         species: species,
                         image: image,
                         url: url,
                         episode: episode,
                         gender: gender,
                         status: status)
    }
}
