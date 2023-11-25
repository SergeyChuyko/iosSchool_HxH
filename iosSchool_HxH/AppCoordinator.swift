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

            self?.charactersBootstrap()

            self?.authBootstrap()
        }
        setRoot(viewController: coordinator.make())
    }

    private func authBootstrap() {
        let authCoordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func registrationBootstrap() {
        setRoot(viewController: assembly.registrationCoordinator { print("Closure registration is Done!") }.make())
    }

    private func locationsBootstrap() {
        setRoot(viewController: assembly.locationsCoordinator().make())
    }

    private func charactersBootstrap() {
        setRoot(viewController: assembly.charactersCoordinator().make())
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationsCoordinator()
        guard let locationsVC = locationsCoord.make() else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = RootTab.locations.tabBarItem
        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
