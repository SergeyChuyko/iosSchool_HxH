//
//  Assembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 26.10.2023.
//

import Foundation
import UIKit

class Assembly {

    lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)
    lazy var storageManager: StorageManager = StorageManagerImp()

    var apiClient: ApiClient {
        ApiClient()
    }
    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
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
