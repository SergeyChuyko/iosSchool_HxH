//
//  Assembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 26.10.2023.
//

import Foundation
class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }
    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
    }
}
