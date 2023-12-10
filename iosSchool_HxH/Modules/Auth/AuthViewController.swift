//
//  AuthViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import UIKit
import SPIndicator
import PKHUD

class AuthViewController<View: AuthView>: BaseViewController<View> {

    var onOpenRegistration: (() -> Void)?

    private var onOpenLogin: (() -> Void)?
    private let dataProvider: AuthDataProvider
    private let storageManager: StorageManager

    init(
        dataProvider: AuthDataProvider,
        storageManager: StorageManager,
        onOpenLogin: (() -> Void)?) {
            self.dataProvider = dataProvider
            self.onOpenLogin = onOpenLogin
            self.storageManager = storageManager

            super.init(nibName: nil, bundle: nil)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        rootView.delegate = self

        someLogin()
    }

    func someLogin() {
        dataProvider.auth(login: "SomeTest", password: "12345678") { token, error in
            print(token ?? "No token")
            print(error?.rawValue ?? "no error")
        }

    }
}

    // MARK: - AuthViewDelegate

extension AuthViewController: AuthViewDelegate {
    func loginButtonDidTap(login: String, password: String) {
        HUD.show(.progress)
        dataProvider.auth(login: login, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, let token else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.storageManager.saveToken(token: token)
            self.onOpenLogin?()
            self.storageManager.saveLastEntryDate()
        }
    }

    func registrationButtonDidTap() {
        onOpenRegistration?()
    }
}
