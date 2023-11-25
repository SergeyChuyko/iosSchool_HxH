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
        var onRegistrationSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.registrationVC(onRegistrationSuccess: context.onRegistrationSuccess)
    }
}
