//
//  CabinetLoginCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 22.12.2023.
//

import UIKit

class CabinetLoginCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var loginLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(27)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(27)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: CabinetLoginCellData) {
        loginLabel.text = inputData.login
    }
}
