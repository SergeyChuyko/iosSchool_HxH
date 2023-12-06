//
//  CharactersViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {

    private var characters: [Character] = []
    private let charactersDataProvider: CharactersDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageSerivce: ImageService

    init(charactersDataProvider: CharactersDataProvider, data: LocationsCellData, imageSerivce: ImageService) {
        self.charactersDataProvider = charactersDataProvider
        charactersUrlList = data.residents
        self.imageSerivce = imageSerivce
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter(id: 5)
        view.backgroundColor = .red

        charactersUrlList.forEach { url in
            requestCharacher(url: url) { [weak self] character in
                print(character.name)
                self?.imageSerivce.getImage(url: character.image, completion: { image in
                    print(image ?? 0)
                })
            }
        }

    }

    func getCharacter(id: Int) {
        charactersDataProvider.getCharacter(id: id) { character, error in
            print(character ?? "No character")
            print(error?.rawValue ?? "No error")
        }
    }

    private func requestCharacher(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.charactersDataProvider.character(url: url) { [weak self] character, error in
                if let character {
                    self?.updateQueue.async {
                        self?.characters.append(character)
                        completion(character)
                    }
                } else {
                    print(error ?? "error")
                }
            }
        }
    }
}
