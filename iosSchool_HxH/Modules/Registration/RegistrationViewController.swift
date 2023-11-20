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

    init(dataProvider: RegistrationDataProvider) {
        self.dataProvider = dataProvider
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
        registrationTest()
    }

    func registrationTest() {
        dataProvider.registration(username: "SomeName2", password: "12345678") { token, error in
            print(token?.token ?? "No token")
            print(error?.rawValue ?? "No error")
        }
    }
}
