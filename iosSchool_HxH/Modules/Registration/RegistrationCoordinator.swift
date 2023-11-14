//
//  RegistrationCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.registrationVC()
    }
}
