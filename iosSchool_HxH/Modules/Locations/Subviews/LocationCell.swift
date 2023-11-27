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

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    // MARK: - Private methods

    private func update(data: LocationsCellData) {
        nameLabel.text = data.name
    }

}
