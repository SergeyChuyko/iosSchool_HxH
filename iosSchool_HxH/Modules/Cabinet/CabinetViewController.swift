//
//  CabinetViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import UIKit

class CabinetViewController<View: CabinetView>: BaseViewController<View> {

    private var unLogin: (() -> Void)?
    private let storageManager: StorageManager
    private let dateManager: DateManager

    init(unLogin: (() -> Void)?, storageManager: StorageManager, dateManager: DateManager) {
        self.unLogin = unLogin
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
        view.backgroundColor = .red
        let selectClosure: ((CoreCellInputData) -> Void)? = { [weak self] _ in
            self?.storageManager.removeTokern()
            self?.unLogin?()
        }
        rootView.update(
            data: .init(
                image: UIImage(named: "profileBackground-image") ?? UIImage(),
                registerLogin: self.storageManager.getRegisterLogin(),
                entryDate: self.dateManager.format(date: self.storageManager.lastEntryDate() ?? Date()),
                unLogin: selectClosure
            )
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
