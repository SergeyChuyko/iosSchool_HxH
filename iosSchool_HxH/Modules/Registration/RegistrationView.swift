//
//  RegistrationView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

protocol RegistrationView: UIView {
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var imageView: UIImageView!
    private var backgroundimageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var reenterPasswordTextField: UITextField!
    @IBOutlet private var enterButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!

    func setView() {

        loginTextField.text = "Введите логин"


        passwordTextField.text = "Введите пароль"


        reenterPasswordTextField.text = "Повторите пароль"


        enterButton.titleLabel?.text = "Готова"


        cancelButton.titleLabel?.text = "Назад"
    }
}
