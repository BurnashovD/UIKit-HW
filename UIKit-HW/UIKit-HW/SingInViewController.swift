//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit
// Контроллер отвечает за экран регистрации
class SingInViewController: UIViewController {
    
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
        // MARK: - Conture for logo label
        contureLogoLabel.frame = CGRect(x: 0, y: 0, width: 203, height: 83)
        contureLogoLabel.center = CGPoint(x: 210, y: 230)
        contureLogoLabel.backgroundColor = UIColor.systemGray4
        view.addSubview(contureLogoLabel)
        // MARK: - Logo of Birthday Reminder
        logoLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        logoLabel.center = CGPoint(x: 210, y: 230)
        logoLabel.backgroundColor = UIColor.white
        logoLabel.textAlignment = .center
        logoLabel.text = "Birthday Reminder"
        logoLabel.font = UIFont(name: "Optima", size: 20)
        logoLabel.layer.cornerRadius = 22

        view.addSubview(logoLabel)
        // MARK: - Add Baloon image
        imageView = UIImageView(frame: CGRect(x: (-60), y: (-20), width: 300, height: 300))
        imageView.image = UIImage(named: "baloon")
        
        view.addSubview(imageView)
        // MARK: - Sing In Label
        singInLabel.frame = CGRect(x: 50, y: 210, width: 300, height: 300)
        singInLabel.text = "Sing in"
        singInLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        view.addSubview(singInLabel)
        // MARK: - Email Label
        emailLabel.frame = CGRect(x: 45, y: 378, width: 100, height: 100)
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "DIN Alternate", size: 18)
        emailLabel.textColor = UIColor.systemBlue
        view.addSubview(emailLabel)
        // MARK: - TextField for email and print it to consol
        textForEmail.frame = CGRect(x: 45, y: 445, width: 330, height: 35)
        textForEmail.placeholder = "Введите email"
        textForEmail.autocorrectionType = .no
        textForEmail.addTarget(self, action: #selector(getEmailAction), for: .editingDidEnd)
        firstLine.frame = CGRect(x: 45, y: 483, width: 330, height: 1)
        firstLine.backgroundColor = UIColor.lightGray
        view.addSubview(textForEmail)
        view.addSubview(firstLine)
        // MARK: - TextField for password and print it to consol
        passwordLabel.frame = CGRect(x: 45, y: 480, width: 100, height: 100)
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "DIN Alternate", size: 18)
        passwordLabel.textColor = UIColor.systemBlue
        textForPassword.frame = CGRect(x: 45, y: 547, width: 330, height: 35)
        textForPassword.placeholder = "Введите пароль"
        textForPassword.autocorrectionType = .no
        textForPassword.isSecureTextEntry = true
        textForPassword.addTarget(self, action: #selector(getPasswordAction), for: .editingDidEnd)
        secondLine.frame = CGRect(x: 45, y: 585, width: 330, height: 1)
        secondLine.backgroundColor = UIColor.lightGray
        view.addSubview(passwordLabel)
        view.addSubview(textForPassword)
        view.addSubview(secondLine)
        // MARK: - Log In Button
        logInButtomn.backgroundColor = UIColor.lightGray
        logInButtomn.layer.cornerRadius = 20
        logInButtomn.setTitle("Войти", for: .normal)
        view.addSubview(logInButtomn)
        // MARK: - Add switch to FaceID
        faceIdSwitcher.frame = CGRect(x: 300, y: 630, width: 100, height: 100)
        view.addSubview(faceIdSwitcher)
        // MARK: - Label For FaceID
        labelForFaceID.frame = CGRect(x: 160, y: 596, width: 200, height: 100)
        labelForFaceID.text = "Вход по Face ID"
        labelForFaceID.font = UIFont(name: "DIN Alternate", size: 18)
        labelForFaceID.textColor = UIColor.systemBlue
        view.addSubview(labelForFaceID)
        // MARK: - Show or hide password button
        showPasswordButton.frame = CGRect(x: 330, y: 550, width: 35, height: 35)
        showPasswordButton.setBackgroundImage(eyeImage, for: .normal)
        showPasswordButton.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        showPasswordButton.addTarget(self, action: #selector(hidePasswordAction), for: .touchDown)
        view.addSubview(showPasswordButton)
    }
// MARK: - Methods prints email and password to consol
    @objc func getEmailAction() {
        print("Email: \(textForEmail.text ?? "")")
    }
    @objc func getPasswordAction() {
        print("Password: \(textForPassword.text ?? "")")
    }
    // MARK: - Present Main VC
    @objc func goToMainViewControllerAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(identifier: "MainViewController") as! MainViewController
        let navigation = UINavigationController(rootViewController: mainVC)
        view.addSubview(navigation.view)
        navigation.didMove(toParent: self)
    }
    // MARK: - Show and hide password
    @objc func showPasswordAction() {
        textForPassword.isSecureTextEntry = true
    }
    @objc func hidePasswordAction() {
        textForPassword.isSecureTextEntry = false
    }
}
