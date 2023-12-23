//
//  CabinetAvatarCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import UIKit
struct CabinetAvatarCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let image: UIImage
}
