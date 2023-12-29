//
//  CoreCellInputData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 07.12.2023.
//

import Foundation

protocol CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)? { get }
}
