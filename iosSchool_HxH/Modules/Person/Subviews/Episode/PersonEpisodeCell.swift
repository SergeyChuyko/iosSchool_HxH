//
//  PersonEpisodeCell.swift
//  iosSchoolHH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var numberView: UIView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var episodeNameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(top: 33, leading: 18, bottom: 50, trailing: 5)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        cellSettings()
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
        episodeNameLabel.text = inputData.name
        dateLabel.text = inputData.airDate
    }

    private func cellSettings() {
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        numberViewSettings(to: numberView)
    }

    private func numberViewSettings(to view: UIView) {
        numberView.backgroundColor = UIColor(named: "cellNumber-color")
        numberView.layer.cornerRadius = 15
        numberView.clipsToBounds = false
        numberView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        numberView.layer.shadowOpacity = 1
        numberView.layer.shadowRadius = 4
        numberView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
