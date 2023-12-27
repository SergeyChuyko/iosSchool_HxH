//
//  CabinetLoginCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 22.12.2023.
//

import Foundation
struct CabinetLoginCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let login: String?
}
