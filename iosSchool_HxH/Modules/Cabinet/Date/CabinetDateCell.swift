//
//  CabinetDateCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 17.12.2023.
//

import UIKit

class CabinetDateCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var dateEntryView: UIView!
    @IBOutlet private weak var profileColorView: UIView!
    @IBOutlet private weak var dateEntryLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var profileColorLabel: UILabel!
    @IBOutlet private weak var profileColorLapView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        labelSettings(label: dateEntryView)
        labelSettings(label: profileColorView)
        profileColorLapView.layer.cornerRadius = 10
        profileColorLapView.clipsToBounds = false
    }

      static func layoutSection() -> NSCollectionLayoutSection {
          let itemSize = NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1),
              heightDimension: .absolute(98)
          )
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          let groupSize = NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1),
              heightDimension: .absolute(98)
          )
          let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
          let section = NSCollectionLayoutSection(group: group)
          section.interGroupSpacing = 0
          section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
          return section
      }

      func update(with inputData: CabinetDateCellData) {
          dateLabel.text = inputData.date
      }

      // MARK: - Private methods

      private func labelSettings(label: UIView) {
          label.layer.cornerRadius = 15
          label.layer.borderWidth = 1
          label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
          label.layer.shadowOpacity = 1
          label.layer.shadowRadius = 8
          label.layer.shadowOffset = CGSize(width: 0, height: 5)
      }
}
