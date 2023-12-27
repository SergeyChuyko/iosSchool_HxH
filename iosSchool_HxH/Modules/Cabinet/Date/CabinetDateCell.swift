//
//  CabinetDateCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import UIKit

class CabinetDateCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var profileColorView: UIView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        shadowsSettings(view: cellView)
        shadowsSettings(view: profileColorView)
        profileColorView.layer.cornerRadius = 10
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(98)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(18)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: CabinetDateCellData) {
        if inputData.date != nil {
            profileColorView.isHidden = true
            textLabel.text = "Дата входа"
            dateLabel.text = inputData.date ?? ".. .. ...."
            dateLabel.isHidden = false
            profileColorView.backgroundColor = .clear
        } else {
            dateLabel.isHidden = true
            textLabel.text = "Цвет профиля"
            profileColorView.backgroundColor = inputData.color ?? .clear
            profileColorView.isHidden = false
        }
    }

    // MARK: - Private methods

    private func shadowsSettings(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
