//
//  CharactersCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 07.12.2023.
//

import UIKit
import PKHUD

class CharactersCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var imageView: UIImageView!

    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(167)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(167)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(24)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        cellSettings()
    }

    func update(with inputData: CharactersCellData) {
        if inputData.isLoading {
            startLoading()
            nameLabel.text = inputData.name
            typeLabel.text = inputData.type
        } else {
            stopLoading()
            imageView.image = inputData.image
            nameLabel.text = inputData.name
            typeLabel.text = inputData.type
        }
    }

    private func startLoading() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
    }

    private func stopLoading() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }

    private func cellSettings() {
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)

        sizeSetting(to: nameLabel)
        sizeSetting(to: typeLabel)
        imageView.image = UIImage(named: "placeholder-image")
    }

    private func sizeSetting(to label: UILabel) {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.sizeToFit()
    }
}
