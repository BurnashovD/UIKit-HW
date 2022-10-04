//
//  RegistarcionViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 03.10.2022.
//

import UIKit
// Класс регистрации пользователя
final class RegistarcionViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addNewProfileButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Add" else { return }
        guard let destination = segue.destination as? SingInViewController else { return }
        destination.usersData.append(loginTextField.text!)
        destination.usersData.append(passwordTextField.text!)
    }
    
    func configUI() {
        loginTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
        notificationCenter()
    }
    
    // MARK: - Private methods
    private func notificationCenter() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y -= 30
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
}

// MARK: - UITextFieldDelegate
extension RegistarcionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            loginTextField.becomeFirstResponder()
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
