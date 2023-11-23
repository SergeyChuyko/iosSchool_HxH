//
//  AuthAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC(onOpenLogin: (() -> Void)?) -> AuthViewController<AuthViewImp>
    func authDataProvider() -> AuthDataProvider
    func authCoordinator(onOpenLogin: (() -> Void)?) -> AuthCoordinator
}

extension Assembly: AuthAssembly {
    func authVC(onOpenLogin: (() -> Void)?) -> AuthViewController<AuthViewImp> {
        .init(dataProvider: authDataProvider(), onOpenLogin: onOpenLogin)

    }

    func authDataProvider() -> AuthDataProvider {
        return AuthDataProviderImp(apiClient: apiClient)
    }

    func authCoordinator(onOpenLogin: (() -> Void)?) -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init(onOpenLogin: onOpenLogin))

    }
}
