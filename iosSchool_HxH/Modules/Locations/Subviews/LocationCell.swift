//
//  LocationCell.swift
//  iosSchool_HxH
//
//  Created by Sergo on 27.11.2023.
//

import UIKit

class LocationCell: UITableViewCell {

    var data: LocationsCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var typeLocationLabel: UILabel!
    @IBOutlet private var populationLabel: UILabel!
    @IBOutlet private var transitionImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        transitionImageView.image = UIImage(named: "next-image")
        sizeSetting(to: nameLabel)
        sizeSetting(to: typeLocationLabel)
        sizeSetting(to: populationLabel)
    }

    // MARK: - Private methods

    private func sizeSetting(to label: UILabel) {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
    }

    private func update(data: LocationsCellData) {
        nameLabel.text = data.name
        typeLocationLabel.text = String(data.type)
        populationLabel.text = "Население: " + String(data.residents.count)
    }

}
