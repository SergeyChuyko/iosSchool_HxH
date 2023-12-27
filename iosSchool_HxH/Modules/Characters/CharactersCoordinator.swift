//
//  CharactersCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import UIKit

class CharactersCoordinator: BaseCoordinator<CharactersCoordinator.Context> {
    struct Context {
        let data: LocationsCellData
    }

    override func make() -> UIViewController? {
        let characterVC = assembly.charactersVC(data: context.data)
        characterVC.selectCharacter = { [weak characterVC] characterVM in
            let coordinator = self.assembly.personCoordinator(data: characterVM)
            guard let personVC = coordinator.make() else {
                return
            }
            characterVC?.navigationController?.pushViewController(personVC, animated: true)
        }
        return characterVC
    }
}
