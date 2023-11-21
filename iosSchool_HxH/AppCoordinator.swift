//
//  AppCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import Foundation
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: coordinator.make())
    }

    private func authBootstrap() {
        setRoot(viewController: assembly.charactersCoordinator().make())
    }

    private func registrationBootstrap() {
        setRoot(viewController: assembly.registrationCoordinator().make())
    }

    private func locationsBootstrap() {
        setRoot(viewController: assembly.locationsCoordinator().make())
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
