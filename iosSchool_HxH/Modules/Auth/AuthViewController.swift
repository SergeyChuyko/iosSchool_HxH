//
//  AuthViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()

        let characterGenerator = CharacterGenerator()
        let allCharacters: [Character] = (1...10).map { _ in
            characterGenerator.generateSomeCharacter()
        }

        let maleCharacters = allCharacters.filter { $0.gender == .male }
        let charactersWithA = allCharacters.filter { $0.name.lowercased().contains("a") }
        let names = ["Ann", "Sergo", "Max", "Vlad", "Kirill"]
        let charactersFromNames = names.map { name in
            return Character(
                id: Int.random(in: 1...99),
                name: name,
                species: "Human",
                image: "\(name.lowercased()).jpeg",
                url: "CharacterURL: https://www.\(name.lowercased()).com",
                episode: ["Episode number: 1"],
                gender: Character.Gender.allCases.randomElement() ?? .unknown,
                status: Character.Status.allCases.randomElement() ?? .unknown
            )
        }
        let episodeNames = ["Episode 1", "Episode 2", "Episode 3"]
        let charactersForEpisodesMap = episodeNames.map { _ in
            (1...3).map { _ in
                CharacterGenerator().generateSomeCharacter()
            }
        }
        let charactersForEpisodesCompactMap = episodeNames.compactMap { _ in
            (1...3).compactMap { _ in
                CharacterGenerator().generateSomeCharacter()
            }
        }

        let totalNameLength = allCharacters.reduce(0) { $0 + $1.name.count }

        print("Все персонажи:")
        allCharacters.forEach { print($0.name, "-", $0.gender.rawValue) }
        print("\nМужские персонажи:")
        maleCharacters.forEach { print($0.name, "-", $0.gender.rawValue) }
        print("\nПерсонажи с буквой |а| в имени:")
        charactersWithA.forEach {print($0.name)}
        print("\nПерсонажи из массива имен:")
        charactersFromNames.forEach {print($0.name)}
        print("\nПерсонажи для каждой серии (map):")
        charactersForEpisodesMap.forEach {
            $0.forEach {print($0.name)}
        }
        print("\nПерсонажи для каждой серии (compactMap):")
        charactersForEpisodesCompactMap.forEach {
            $0.forEach {print($0.name)}
        }
        print("\nСумма длин всех имен: \(totalNameLength)")
        login()
        }

    func login() {
        dataProvider.auth(login: "Sergo", password: "Jopa1999") { token, error in
            print(token ?? "\nнет токена")
            print(error?.rawValue ?? "нет ошибки")
        }
    }
}
