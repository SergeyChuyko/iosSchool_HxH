//
//  LocationsCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

class LocationsCoordinator: BaseCoordinator<LocationsCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.locationsVC()
    }
}
