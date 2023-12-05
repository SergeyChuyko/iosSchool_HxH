//
//  CharactersCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

class CharactersCoordinator: BaseCoordinator<CharactersCoordinator.Context> {
    struct Context {
        let data: LocationsCellData
    }

    override func make() -> UIViewController? {
        assembly.charactersVC(data: context.data)
    }
}
