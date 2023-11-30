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
        let locationVC = assembly.locationsVC()
        locationVC.selectLocation = { [weak locationVC] locationData in
            let coordinator = self.assembly.charactersCoordinator(data: locationData)
            guard let characterVC = coordinator.make() else {
                return
            }
            locationVC?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return locationVC
    }
}
