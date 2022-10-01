//
//  SingInViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Отвечает за экран входа
final class SingInViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Visual components
    lazy var createPizzaLogoImageView: UIImageView = {
        let imageView  = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.center = CGPoint(x: 200, y: 200)
        imageView.image = UIImage(named: "pizzaLogo")
        return imageView
    }()
    lazy var createEmailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 40, y: 350, width: 100, height: 30)
        emailLabel.text = "Телефон"
        emailLabel.textColor = .orange
        return emailLabel
    }()
    lazy var createPasswordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.frame = CGRect(x: 40, y: 450, width: 100, height: 30)
        passwordLabel.text = "Пароль"
        passwordLabel.textColor = .orange
        return passwordLabel
    }()
    lazy var createPhoneNumberTextField: UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 40, y: 385, width: 300, height: 40)
        textField.autocorrectionType = .no
        textField.resignFirstResponder()
        textField.placeholder = "Введите номер телефона"
        textField.keyboardType = .asciiCapableNumberPad
        return textField
    }()
    lazy var createPasswordtextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 40, y: 485, width: 300, height: 40)
        textField.autocorrectionType = .no
        textField.resignFirstResponder()
        textField.isSecureTextEntry = true
        textField.placeholder = "Введите пароль"
        return textField
    }()
    lazy var createEntryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        button.center = CGPoint(x: 200, y: 600)
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(segueToMenuVCAction), for: .touchUpInside)
        return button
    }()
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        createPhoneNumberTextField.delegate = self
    }
    // MARK: - Public Methods
    func cofigureUI() {
        view.addSubview(createPizzaLogoImageView)
        view.addSubview(createEmailLabel)
        view.addSubview(createPasswordLabel)
        view.addSubview(createPhoneNumberTextField)
        view.addSubview(createPasswordtextField)
        view.addSubview(createEntryButton)
    }
    // Переход к меню
    @objc func segueToMenuVCAction() {
        let menuVC = MenuViewController()
        navigationController?.pushViewController(menuVC, animated: true)
    }
}
// Расширения для ввода цифр
extension SingInViewController {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == createPhoneNumberTextField {
            let allowedCharacters = CharacterSet(charactersIn: "+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}
