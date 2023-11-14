//
//  AuthCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import Foundation
import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.authVC()
    }
}
