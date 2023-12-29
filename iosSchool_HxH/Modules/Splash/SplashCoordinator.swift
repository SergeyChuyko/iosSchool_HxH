//
//  SplashCoordinator.swift
//  iosSchool_HxH
//
//  Created by Sergo on 09.11.2023.
//

import UIKit

class SplashCoordinator: BaseCoordinator<SplashCoordinator.Context> {
    struct Context {
        let onSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.splashVC(onSuccess: context.onSuccess)
    }
}
