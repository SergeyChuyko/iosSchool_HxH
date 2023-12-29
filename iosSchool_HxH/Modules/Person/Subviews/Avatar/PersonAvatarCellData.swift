//
//  PersonAvatarCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

struct PersonAvatarCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let image: UIImage?
}
