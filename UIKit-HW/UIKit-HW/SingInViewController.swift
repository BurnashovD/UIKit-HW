//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Класс входа пользователя
final class SingInViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var entryButton: UIButton!
    
    // MARK: - Public properties
    var usersData = [String]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
        entryButton.addTarget(self, action: #selector(checkUsersDataAction), for: .touchUpInside)
        notificationCenter()
    }
    
   // MARK: - Private methods
    private func notificationCenter() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y -= 15
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
    
    @objc private func checkUsersDataAction() {
        guard usersData.contains(loginTextField.text!) else {return}
        guard usersData.contains(passwordTextField.text!) else {return}
        performSegue(withIdentifier: "AllGood", sender: self)
    }
}

// MARK: - UITextFieldDelegate
extension SingInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
