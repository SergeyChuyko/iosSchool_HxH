//
//  PersonCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonCoordinator: BaseCoordinator<PersonCoordinator.Context> {
    struct Context {
        let data: CharactersCellData
    }

    override func make() -> UIViewController? {
        assembly.personVC(data: context.data)
    }
}
