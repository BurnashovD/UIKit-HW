//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButtomn: UIButton!
    var logoLabel = UILabel()
    let contureLogoLabel = UIView()
    let imageName = "baloon"
    var imageView = UIImageView()
    let singInLabel = UILabel()
    let emailLabel = UILabel()
    let textForEmail = UITextField()
    let firstLine = UIView()
    let passwordLabel = UILabel()
    let textForPassword = UITextField()
    let secondLine = UIView()
    let logInButton = UIButton()
    let faceIdSwitcher = UISwitch()
    let labelForFaceID = UILabel()
    let showPasswordButton = UIButton()
    let eyeImage = UIImage(named: "eye")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Conture for logo label
        self.contureLogoLabel.frame = CGRect(x: 0, y: 0, width: 203, height: 83)
        self.contureLogoLabel.center = CGPoint(x: 210, y: 230)
        self.contureLogoLabel.backgroundColor = UIColor.systemGray4
        
        self.view.addSubview(contureLogoLabel)
        
        //MARK: - Logo of Birthday Reminder
        self.logoLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        self.logoLabel.center = CGPoint(x: 210, y: 230)
        logoLabel.backgroundColor = UIColor.white
        logoLabel.textAlignment = .center
        logoLabel.text = "Birthday Reminder"
        logoLabel.font = UIFont(name: "Optima", size: 20)
        logoLabel.layer.cornerRadius = 22

        self.view.addSubview(logoLabel)
        
        //MARK: - Add Baloon image
        imageView = UIImageView(frame: CGRect(x: (-60), y: (-20), width: 300, height: 300))
        imageView.image = UIImage(named: "baloon")
        
        self.view.addSubview(imageView)
        
        //MARK: - Sing In Label
        singInLabel.frame = CGRect(x: 50, y: 210, width: 300, height: 300)
        singInLabel.text = "Sing in"
        singInLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        
        self.view.addSubview(singInLabel)
        
        //MARK: - Email Label
        emailLabel.frame = CGRect(x: 45, y: 378, width: 100, height: 100)
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "DIN Alternate", size: 18)
        emailLabel.textColor = UIColor.systemBlue
        
        self.view.addSubview(emailLabel)
        
        //MARK: - TextField for email and print it to consol
        textForEmail.frame = CGRect(x: 45, y: 445, width: 330, height: 35)
//        textForEmail.backgroundColor = UIColor.white
        textForEmail.placeholder = "Введите email"
        textForEmail.autocorrectionType = .no
        textForEmail.addTarget(self, action: #selector(getEmail), for: .editingDidEnd)
        
        firstLine.frame = CGRect(x: 45, y: 483, width: 330, height: 1)
        firstLine.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(textForEmail)
        self.view.addSubview(firstLine)
        
        //MARK: - TextField for password and print it to consol
        passwordLabel.frame = CGRect(x: 45, y: 480, width: 100, height: 100)
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "DIN Alternate", size: 18)
        passwordLabel.textColor = UIColor.systemBlue
        
        textForPassword.frame = CGRect(x: 45, y: 547, width: 330, height: 35)
        textForPassword.placeholder = "Введите пароль"
        textForPassword.autocorrectionType = .no
        textForPassword.isSecureTextEntry = true
        textForPassword.addTarget(self, action: #selector(getPassword), for: .editingDidEnd)
        
        secondLine.frame = CGRect(x: 45, y: 585, width: 330, height: 1)
        secondLine.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(passwordLabel)
        self.view.addSubview(textForPassword)
        self.view.addSubview(secondLine)
        
        //MARK: - Log In Button
        logInButtomn.backgroundColor = UIColor.lightGray
        logInButtomn.layer.cornerRadius = 20
        logInButtomn.setTitle("Войти", for: .normal)
        
        self.view.addSubview(logInButtomn)
        
        //MARK: - Add switch to FaceID
        faceIdSwitcher.frame = CGRect(x: 300, y: 630, width: 100, height: 100)
        self.view.addSubview(faceIdSwitcher)
        
        //MARK: - Label For FaceID
        labelForFaceID.frame = CGRect(x: 160, y: 596, width: 200, height: 100)
        labelForFaceID.text = "Вход по Face ID"
        labelForFaceID.font = UIFont(name: "DIN Alternate", size: 18)
        labelForFaceID.textColor = UIColor.systemBlue
        
        self.view.addSubview(labelForFaceID)
        
        //MARK: - Show or hide password button
        showPasswordButton.frame = CGRect(x: 330, y: 550, width: 35, height: 35)
        showPasswordButton.setBackgroundImage(eyeImage, for: .normal)
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        showPasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchDown)
        
        self.view.addSubview(showPasswordButton)
        
    }
//MARK: - Methods prints email and password to consol
    @objc func getEmail() {
        print("Email: \(self.textForEmail.text ?? "")")
    }
    
    @objc func getPassword() {
        print("Password: \(self.textForPassword.text ?? "")")
    }
    //MARK: - Present Main VC
    @objc func goToMainViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        let navigation = UINavigationController(rootViewController: mainVC)
        self.view.addSubview(navigation.view)
        navigation.didMove(toParent: self)
    }
    //MARK: - Show and hide password
    @objc func showPassword() {
        textForPassword.isSecureTextEntry = true
    }
    @objc func hidePassword() {
        textForPassword.isSecureTextEntry = false
    }
}

