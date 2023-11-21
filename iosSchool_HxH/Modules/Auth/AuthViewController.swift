//
//  AuthViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()

    }

    func someLogin() {
        dataProvider.auth(login: "SomeTest", password: "12345678") { token, error in
            print(token ?? "No token")
            print(error?.rawValue ?? "no error")
        }
    }
}
