//
//  SplashAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 09.11.2023.
//

import Foundation

protocol SplashAssembly {
    func splashVC(onSuccess: (() -> Void)?) -> SplashViewController<SplashViewImp>
    func splashDataProvider() -> SplashDataProvider
    func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator
}

extension Assembly: SplashAssembly {
    func splashVC(onSuccess: (() -> Void)?) -> SplashViewController<SplashViewImp> {
        .init(dataProvider: splashDataProvider(), onSuccess: onSuccess)
    }

    func splashDataProvider() -> SplashDataProvider {
        return SplashDataProviderImp()
    }

    func splashCoordinator(onSuccess: (() -> Void)?) -> SplashCoordinator {
        SplashCoordinator(assembly: self, context: .init(onSuccess: onSuccess))
    }
}
