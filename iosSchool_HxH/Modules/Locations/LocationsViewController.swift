//
//  LocationsViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

class LocationsViewController: UIViewController {
    private let locationsDataProvider: LocationsDataProvider

    init(locationsDataProvider: LocationsDataProvider) {
        self.locationsDataProvider = locationsDataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocations()
    }

    func getLocations() {
        locationsDataProvider.getLocations { locations, error in
            print(locations ?? "No locations")
            print(error?.rawValue ?? "No error")
        }
    }
}
