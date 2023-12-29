//
//  CabinetDateCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import UIKit
struct CabinetDateCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let date: String?
    let color: UIColor?
}
