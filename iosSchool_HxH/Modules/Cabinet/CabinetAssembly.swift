//
//  CabinetAssembly.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import Foundation

protocol CabinetAssembly {
    func cabinetVC(unLogin: (() -> Void)?) -> CabinetViewController<CabinetViewImp>
    func cabinetDataProvider() -> CabinetDataProvider
    func cabinetCoordinator(unLogin: (() -> Void)?) -> CabinetCoordinator
}

extension Assembly: CabinetAssembly {
    func cabinetVC(unLogin: (() -> Void)?) -> CabinetViewController<CabinetViewImp> {
        .init(unLogin: unLogin, storageManager: storageManager, dateManager: dateManager)
    }

    func cabinetDataProvider() -> CabinetDataProvider {
        return CabinetDataProviderImp()
    }

    func cabinetCoordinator(unLogin: (() -> Void)?) -> CabinetCoordinator {
        CabinetCoordinator(assembly: self, context: .init(unLogin: unLogin))
    }

}
