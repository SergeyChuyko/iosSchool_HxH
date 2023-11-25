//
//  RegistrationAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp> {
        .init(registrationDataProvider: registrationDataProvider())
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(registrationApiClient: apiClient)
    }

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }
}
