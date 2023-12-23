//
//  CabinetCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import Foundation
import UIKit

class CabinetCoordinator: BaseCoordinator<CabinetCoordinator.Context> {
    struct Context {
        let unLogin: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.cabinetVC(unLogin: context.unLogin)
    }
}
