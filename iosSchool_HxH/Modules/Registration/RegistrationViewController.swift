//
//  RegistrationViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {

    private let dataProvider: RegistrationDataProvider
    var onRegistrationSuccess: (() -> Void)?

    init(dataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onRegistrationSuccess?()
        registrationTest()
    }

    func registrationTest() {
        dataProvider.registration(username: "SomeName", password: "1234") { token, error in
            print(token?.token ?? "No token")
            print(error?.rawValue ?? "No error")
        }
    }
}
