//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit
// Класс меню входа
class SingInViewController: UIViewController {
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secretText()
        cornerRadiusButton()
    }
    func secretText() {
        passwordText.isSecureTextEntry = true
    }
    func cornerRadiusButton() {
        singInButton.layer.cornerRadius = 25
    }
}
