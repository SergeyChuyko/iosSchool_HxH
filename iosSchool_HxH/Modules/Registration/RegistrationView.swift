//
//  RegistrationView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 11.11.2023.
//

import Foundation
import UIKit

protocol RegistrationView: UIView {
    func setViewRegistration()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var backgroundimageView: UIImageView!
    @IBOutlet private var labelView: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var enterButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!

    func setViewRegistration() {
        imageView.image = UIImage(named: "reg-image")
        backgroundimageView.image = UIImage(named: "reg-background")

        applyTextFieldStyles(to: loginTextField, placeholderText: "Введите логин")
        applyTextFieldStyles(to: passwordTextField, placeholderText: "Введите пароль")
        applyTextFieldStyles(to: repeatPasswordTextField, placeholderText: "Повторите пароль")
        applyShadows(to: loginTextField)
        applyShadows(to: passwordTextField)
        applyShadows(to: repeatPasswordTextField)

        enterButton.setTitle("Готово", for: .normal)
        applyButtonSettings(to: enterButton)
        applyShadows(to: enterButton)

        cancelButton.setTitle("Назад", for: .normal)
        applyButtonSettings(to: cancelButton)
        applyShadows(to: cancelButton)
    }

    func applyButtonSettings(to button: UIButton) {
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "button-color")
        button.tintColor = .white
    }

    func applyTextFieldStyles(to textField: UITextField, placeholderText: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor:
                UIColor(
                    red: 0.318,
                    green: 0.306,
                    blue: 0.306,
                    alpha: 1
            )]
        )
        textField.placeholder = placeholderText
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
    }

    func applyShadows(to view: UIView) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    @IBAction func enterButtonTapped(_ sender: UIButton) {
        print("You tapped enter button")
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        print("You tapped cancel button")
    }
}
