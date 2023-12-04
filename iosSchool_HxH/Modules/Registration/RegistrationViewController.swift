//
//  RegistrationViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let registrationDataProvider: RegistrationDataProvider
    private let storageManager: StorageManager
    var onRegistrationSuccess: (() -> Void)?

    init(registrationDataProvider: RegistrationDataProvider, storageManager: StorageManager, onRegistrationSuccess: (() -> Void)?) {
        self.registrationDataProvider = registrationDataProvider
        self.onRegistrationSuccess = onRegistrationSuccess
        self.storageManager = storageManager

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setViewRegistration()
    }
}
