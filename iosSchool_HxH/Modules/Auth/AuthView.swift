//
//  AuthView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 06.11.2023.
//

import Foundation
import UIKit

protocol AuthView: UIView {
    var delegate: AuthViewDelegate? { get set }
    func setView()
}

protocol AuthViewDelegate: AnyObject {
    func loginButtonDidTap(login: String, password: String)
    func registrationButtonDidTap()
}

class AuthViewImp: UIView, AuthView {

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitlelabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var registrationButton: UIButton!

    weak var delegate: AuthViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {

        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidPat))
        addGestureRecognizer(recognizer)

        imageView.image = UIImage(named: "auth-background")
        imageView.contentMode = .scaleAspectFill
        labelView.layer.cornerRadius = 10
        labelView.layer.masksToBounds = true
        labelView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowRadius = 10
        labelView.layer.shadowOffset = CGSize(width: 0, height: 8)

        applyButtonSettings(to: loginButton)
        applyButtonSettings(to: registrationButton)

        applyTextFieldStyles(to: loginTextField, placeholderText: "Логин")
        applyTextFieldStyles(to: passwordTextField, placeholderText: "Пароль")

        applyShadows(to: loginTextField)
        applyShadows(to: passwordTextField)
        applyShadows(to: loginButton)
        applyShadows(to: registrationButton)

        registrationButton.addTarget(self, action: #selector(registrationDidTap), for: .touchUpInside)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Private
    private func applyButtonSettings(to button: UIButton) {
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "button-color")
        button.tintColor = .white
    }

    private func applyTextFieldStyles(to textField: UITextField, placeholderText: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(
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
        textField.backgroundColor = UIColor(red: 0.897, green: 0.897, blue: 0.897, alpha: 1)
    }

    private func applyShadows(to view: UIView) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    @IBAction private func loginDidTap(_ sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        delegate?.loginButtonDidTap(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
    }

    @objc private func registrationDidTap() {
        delegate?.registrationButtonDidTap()
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardHeight = keyboardFrame.cgRectValue.height

        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc private func keyboardWillHide() {
        scrollView.contentOffset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc private func viewDidPat() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}
