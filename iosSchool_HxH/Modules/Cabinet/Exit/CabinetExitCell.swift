//
//  CabinetExitCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import UIKit

class CabinetExitCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var exitLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.cornerRadius = 10
        exitLabel.layer.cornerRadius = 10
        backgroundColor = UIColor(named: "button-color")

    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 122, leading: 16, bottom: 46, trailing: 16)
        return section
    }

    func update(with inputData: CabinetExitCellData) {
    }
}
