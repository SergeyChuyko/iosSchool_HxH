//
//  EmptyReusableView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 07.12.2023.
//

import UIKit

class EmptyReusableView: UICollectionReusableView, CoreReusableView {

    static func layouItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        nil
    }

    func update(with _: Void) -> Self {
        self
    }

}
