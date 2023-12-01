//
//  RegistrationViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit
import PKHUD
import SPIndicator

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let registrationDataProvider: RegistrationDataProvider
    var onRegistrationSuccess: (() -> Void)?

    init(registrationDataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.registrationDataProvider = registrationDataProvider
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setViewRegistration()
        rootView.delegate = self
    }
}

extension RegistrationViewController: RegistrationViewDelegate {
    func registration(login: String, password: String) {
        HUD.show(.progress)
        registrationDataProvider.registration(username: login, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
                guard let self, token != nil else {
                    DispatchQueue.main.async {
                        SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                    }
                    return
                }
            onRegistrationSuccess?()
        }
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
        print("test")
    }
}
