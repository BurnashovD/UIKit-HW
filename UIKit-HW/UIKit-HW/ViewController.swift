//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var isngInButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        passwordText.isSecureTextEntry = true
        isngInButton.layer.cornerRadius = 25
    }


}

