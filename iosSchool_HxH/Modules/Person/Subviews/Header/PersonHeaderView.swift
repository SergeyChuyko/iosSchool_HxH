//
//  PersonHeaderView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonHeaderView: UICollectionReusableView, CoreReusableView {

    typealias InputData = PersonHeaderViewData
    @IBOutlet private weak var titleLabel: UILabel!

    static func layouItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(55)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return header
    }

    func update(with inputData: PersonHeaderViewData) -> Self {
        titleLabel.text = inputData.title
        return self
    }
}
