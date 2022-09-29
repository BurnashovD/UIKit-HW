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
    let eyeImage = UIImage(named: "eye")
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        label.center = CGPoint(x: 210, y: 230)
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        label.text = "Birthday Reminder"
        label.font = UIFont(name: "Optima", size: 20)
        label.layer.cornerRadius = 22
        return label
    }()
    lazy var contureLogoLabel: UIView = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 203, height: 83)
        label.center = CGPoint(x: 210, y: 230)
        label.backgroundColor = UIColor.systemGray4
        return label
    }()
    let imageName = "baloon"
    lazy var imageView: UIImageView = {
        var image = UIImageView()
        image = UIImageView(frame: CGRect(x: (-60), y: (-20), width: 300, height: 300))
        image.image = UIImage(named: "baloon")
        return image
    }()
    lazy var singInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 210, width: 300, height: 300)
        label.text = "Sing in"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        return label
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 45, y: 378, width: 100, height: 100)
        label.text = "Email"
        label.font = UIFont(name: "DIN Alternate", size: 18)
        label.textColor = UIColor.systemBlue
        return label
    }()
    lazy var textForEmail: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 45, y: 445, width: 330, height: 35)
        field.placeholder = "Введите email"
        field.autocorrectionType = .no
        field.addTarget(self, action: #selector(getEmailAction), for: .editingDidEnd)
        return field
    }()
    lazy var firstLine: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 45, y: 483, width: 330, height: 1)
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 45, y: 480, width: 100, height: 100)
        label.text = "Password"
        label.font = UIFont(name: "DIN Alternate", size: 18)
        label.textColor = UIColor.systemBlue
        return label
    }()
    lazy var textForPassword: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 45, y: 547, width: 330, height: 35)
        field.placeholder = "Введите пароль"
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
        field.addTarget(self, action: #selector(getPasswordAction), for: .editingDidEnd)
        return field
    }()
    lazy var secondLine: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 45, y: 585, width: 330, height: 1)
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 20
        button.setTitle("Войти", for: .normal)
        return button
    }()
    lazy var faceIdSwitcher: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 630, width: 100, height: 100)
        return switcher
    }()
    lazy var labelForFaceID: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 160, y: 596, width: 200, height: 100)
        label.text = "Вход по Face ID"
        label.font = UIFont(name: "DIN Alternate", size: 18)
        label.textColor = UIColor.systemBlue
        return label
    }()
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 330, y: 550, width: 35, height: 35)
        button.setBackgroundImage(eyeImage, for: .normal)
        button.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(hidePasswordAction), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI() {
        view.addSubview(contureLogoLabel)
        view.addSubview(logoLabel)
        view.addSubview(imageView)
        view.addSubview(singInLabel)
        view.addSubview(emailLabel)
        view.addSubview(textForEmail)
        view.addSubview(firstLine)
        view.addSubview(passwordLabel)
        view.addSubview(textForPassword)
        view.addSubview(secondLine)
        view.addSubview(logInButtomn)
        view.addSubview(faceIdSwitcher)
        view.addSubview(labelForFaceID)
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
