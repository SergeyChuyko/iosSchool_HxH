//
//  CabinetDateCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import Foundation
struct CabinetDateCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let date: String
}
