//
//  CoreCellView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 07.12.2023.
//

import Foundation
import UIKit

protocol CoreCellView: UICollectionViewCell, CoreNibReusable {
    associatedtype InputData: CoreCellInputData

    static func layoutSection() -> NSCollectionLayoutSection
    func update(with inputData: InputData)
}
