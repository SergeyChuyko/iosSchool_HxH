//
//  CoreReusableVIew.swift
//  iosSchool_HxH
//
//  Created by Sergo on 07.12.2023.
//

import UIKit

protocol CoreReusableView: UICollectionReusableView, CoreNibReusable {
    associatedtype InputData

    static func layouItem() -> NSCollectionLayoutBoundarySupplementaryItem?
    func update(with inputData: InputData) -> Self
}
