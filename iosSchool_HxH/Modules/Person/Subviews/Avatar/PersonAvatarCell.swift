//
//  PersonAvatarCell.swift
//  iosSchoolHH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonAvatarCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var characterImageView: UIImageView!
    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.75)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.75)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 37, leading: 16, bottom: -84, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cellSettings()
    }

    // MARK: - Functions
    func update(with inputData: PersonAvatarCellData) {
        characterImageView.image = inputData.image
    }

    // MARK: - Private function

    private func cellSettings() {
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
