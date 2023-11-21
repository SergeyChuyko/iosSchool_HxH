//
//  CharactersViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {
    private let charactersDataProvider: CharactersDataProvider

    init(charactersDataProvider: CharactersDataProvider) {
        self.charactersDataProvider = charactersDataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter(id: 5)
        view.backgroundColor = .red
    }

    func getCharacter(id: Int) {
        charactersDataProvider.getCharacter(id: id) { character, error in
            print(character ?? "No character")
            print(error?.rawValue ?? "No error")
        }
    }
}
