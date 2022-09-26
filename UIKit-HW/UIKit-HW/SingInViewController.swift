//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit
// Rласс меню входа
class SingInViewController: UIViewController {
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secretText()
        singInButton.layer.cornerRadius = 25
    }
    func secretText() {
        passwordText.isSecureTextEntry = true
    }
}
