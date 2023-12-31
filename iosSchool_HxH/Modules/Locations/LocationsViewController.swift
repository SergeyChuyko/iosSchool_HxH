//
//  LocationsViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import UIKit
import PKHUD

class LocationsViewController<View: LocationsView>: BaseViewController<View> {
    var selectLocation: ((LocationsCellData) -> Void)?
    private let locationsDataProvider: LocationsDataProvider

    init(locationsDataProvider: LocationsDataProvider) {
        self.locationsDataProvider = locationsDataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfLocation()
        rootView.setView()
        setupBar()
        rootView.selectLocation = selectLocation
    }

    @objc func reload() {
        getListOfLocation()
    }

    // MARK: - Private func

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        if let customImage = UIImage(named: "refresh-image")?.withRenderingMode(.alwaysOriginal) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                image: customImage,
                style: .plain,
                target: self,
                action: #selector(reload)
            )
        }
    }

    private func getListOfLocation() {
        HUD.show(.progress)
        locationsDataProvider.getLocations { [weak self] locationList, _ in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let locationList else {
                return
            }
            self?.rootView.update(data: LocationsViewData(list: locationList))
        }
    }
}
