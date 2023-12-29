//
//  BaseNavigationController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.11.2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "iceberg-color")
        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg-color")
        navigationBar.barTintColor = UIColor(named: "iceberg-color")
        navigationBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        navigationBar.layer.shadowOpacity = 0.4
        navigationBar.layer.shadowRadius = 5
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 8)
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
