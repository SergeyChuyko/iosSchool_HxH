//
//  BaseNavigationController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.11.2023.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate,
    UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg-color")
        view.backgroundColor = UIColor(named: "iceberg-color")
        navigationBar.barTintColor = UIColor(named: "iceberg-color")
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
