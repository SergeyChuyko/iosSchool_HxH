//
//  RegistrationView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

protocol RegistrationView: UIView {
    func setViewReg()
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

    func setViewReg() {
        imageView.image = UIImage(named: "reg-image")

        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите логин",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.32, green: 0.31, blue: 0.31, alpha: 1)
            ])
        loginTextField.layer.cornerRadius = 15
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.backgroundColor = UIColor.white

        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.32, green: 0.31, blue: 0.31, alpha: 1)
            ])
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.backgroundColor = UIColor.white

        reenterPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Повторите пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.32, green: 0.31, blue: 0.31, alpha: 1)
            ])
        reenterPasswordTextField.layer.cornerRadius = 15
        reenterPasswordTextField.layer.borderWidth = 1
        reenterPasswordTextField.layer.masksToBounds = true
        reenterPasswordTextField.layer.borderColor = UIColor.black.cgColor
        reenterPasswordTextField.backgroundColor = UIColor.white

        enterButton.titleLabel?.text = "Готово"
        enterButton.layer.cornerRadius = 10
        enterButton.layer.masksToBounds = true
        enterButton.backgroundColor = UIColor(red: 0.33, green: 0.51, blue: 0.71, alpha: 1)

        cancelButton.titleLabel?.text = "Назад"
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
        cancelButton.backgroundColor = UIColor(red: 0.33, green: 0.51, blue: 0.71, alpha: 1)

    }
}
