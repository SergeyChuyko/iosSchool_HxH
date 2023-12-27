//
//  CabinetViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import UIKit

class CabinetViewController<View: CabinetView>: BaseViewController<View> {
    private var logout: (() -> Void)?
    private let storageManager: StorageManager
    private let dateManager: DateManager

    init(logout: (() -> Void)?, storageManager: StorageManager, dateManager: DateManager) {
        self.logout = logout
        self.storageManager = storageManager
        self.dateManager = dateManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.update(
            data: .init(
                image: UIImage(named: "profileBackground-image") ?? UIImage(),
                registerLogin: self.storageManager.getRegisterLogin(),
                entryDate: self.dateManager.format(date: self.storageManager.lastEntryDate() ?? Date()),
                color: UIColor(named: "iceberg-color") ?? .red,
                logout: { [weak self] _ in
                    self?.storageManager.removeTokern()
                    self?.logout?()
                }
            )
        )
    }
}
