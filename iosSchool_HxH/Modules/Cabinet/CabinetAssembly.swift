//
//  CabinetAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import Foundation

protocol CabinetAssembly {
    func cabinetVC(logout: (() -> Void)?) -> CabinetViewController<CabinetViewImp>
    func cabinetDataProvider() -> CabinetDataProvider
    func cabinetCoordinator(logout: (() -> Void)?) -> CabinetCoordinator
}

extension Assembly: CabinetAssembly {
    func cabinetVC(logout: (() -> Void)?) -> CabinetViewController<CabinetViewImp> {
        .init(logout: logout, storageManager: storageManager, dateManager: dateManager)
    }

    func cabinetDataProvider() -> CabinetDataProvider {
        return CabinetDataProviderImp()
    }

    func cabinetCoordinator(logout: (() -> Void)?) -> CabinetCoordinator {
        CabinetCoordinator(assembly: self, context: .init(logout: logout))
    }
}
