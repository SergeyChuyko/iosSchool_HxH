//
//  LocationsView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

protocol LocationsView: UIView {
    var selectLocation: ((LocationsCellData) -> Void)? { get set }

    func setView()
    func update(data: LocationsViewData)
}

class LocationsViewImp: UIView, LocationsView {
    var selectLocation: ((LocationsCellData) -> Void)?

    private var viewData: LocationsViewData?
    private let tableView = UITableView()
    private let identifier = LocationCell.className

    func setView() {
        backgroundColor = .white
        let imageView = UIImageView()
        imageView.image = UIImage(named: "locations-background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .none
        tableView.allowsSelectionDuringEditing = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .black
    }

    func update(data: LocationsViewData) {
        viewData = data

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension LocationsViewImp: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData?.cellsData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewData else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else { return UITableViewCell() }
        (cell as? LocationCell)?.data = viewData.cellsData[indexPath.row]
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
        return cell
    }

}

extension LocationsViewImp: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewData else {
            return
        }
        selectLocation?(viewData.cellsData[indexPath.row])
    }
}
