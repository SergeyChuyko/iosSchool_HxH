//
//  CabinetViewData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import UIKit

struct CabinetViewData {
    let cabinetAvatarData: CabinetAvatarCellData
    let cabinetLoginData: CabinetLoginCellData
    let cabinetDateData: [CabinetDateCellData]
    let episodeExitData: CabinetExitCellData

    init(
        image: UIImage?,
        registerLogin: String?,
        entryDate: String?,
        color: UIColor?,
        logout: ((CoreCellInputData) -> Void)?
    ) {
        cabinetAvatarData = CabinetAvatarCellData(image: image)
        cabinetLoginData = CabinetLoginCellData(login: registerLogin)
        cabinetDateData = [
            CabinetDateCellData(date: entryDate, color: nil),
            CabinetDateCellData(date: nil, color: color)
        ]
        episodeExitData = CabinetExitCellData(selectClosure: logout)
    }
}
