//
//  Assembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 26.10.2023.
//

import UIKit

class Assembly {
    lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)
    lazy var storageManager: StorageManager = StorageManagerImp()
    lazy var dateManager: DateManager = DateManagerImp()

    var apiClient: ApiClient {
        ApiClient()
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
