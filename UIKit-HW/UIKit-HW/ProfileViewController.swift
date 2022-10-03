//
//  ProfileViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 27.09.2022.
//

import UIKit
// Класс отвечает за профиль пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Visual components
    private lazy var profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 140, y: 80, width: 130, height: 130)
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    private lazy var changeProfilePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 75, y: 230, width: 250, height: 20)
        button.setTitle("Изменить фото профиля", for: .normal)
        button.addTarget(self, action: #selector(selectProfilePhotoAction), for: .touchUpInside)
        return button
    }()
    private lazy var backToMainMenuButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 10, width: 50, height: 50)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(backToMainMenuAction), for: .touchUpInside)
        return button
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 183, y: 260, width: 100, height: 100)
        label.text = "Name"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        label.textColor = .white
        return label
    }()
    private lazy var nameTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        field.center = CGPoint(x: 200, y: 350)
        field.autocorrectionType = .no
        field.placeholder = "Введите имя"
        field.textAlignment = .center
        field.textColor = .white
        field.font = UIFont(name: "American Typewriter", size: 20)
        return field
    }()
    private lazy var lineUnderNameText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        view.center = CGPoint(x: 200, y: 360)
        view.backgroundColor = .white
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 175, y: 365, width: 300, height: 50)
        label.text = "Birthday"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        return label
    }()
    private lazy var dateTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        field.center = CGPoint(x: 200, y: 430)
        field.autocorrectionType = .no
        field.placeholder = "Выберите дату"
        field.textAlignment = .center
        field.textColor = .white
        field.font = UIFont(name: "American Typewriter", size: 20)
        return field
    }()
    private lazy var lineUnderDateText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        view.center = CGPoint(x: 200, y: 440)
        view.backgroundColor = .white
        return view
    }()
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 185, y: 445, width: 300, height: 50)
        label.text = "Email"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        label.textColor = .white
        return label
    }()
    private lazy var emailTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        field.center = CGPoint(x: 200, y: 510)
        field.placeholder = "Укажите почту"
        field.textAlignment = .center
        field.textColor = .white
        field.font = UIFont(name: "American Typewriter", size: 20)
        return field
    }()
    private lazy var lineUnderEmailText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        view.backgroundColor = .white
        view.center = CGPoint(x: 200, y: 520)
        return view
    }()
    private lazy var notifyLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 600, width: 300, height: 30)
        label.text = "Включить уведомления"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        label.textColor = .white
        return label
    }()
    private lazy var notifySwitcher: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 310, y: 600, width: 60, height: 60)
        switcher.addTarget(self, action: #selector(afterSwitcherIsOnAlertAction), for: .valueChanged)
        return switcher
    }()
    
    let datePicker = UIDatePicker()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        view.addSubview(profilePhotoImageView)
        view.addSubview(changeProfilePhotoButton)
        view.addSubview(backToMainMenuButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(lineUnderNameText)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(lineUnderDateText)
        view.addSubview(emailLabel)
        view.addSubview(lineUnderEmailText)
        view.addSubview(emailTextField)
        view.addSubview(notifyLabel)
        view.addSubview(notifySwitcher)
        createDatePicker()
    }
    
    // Method add Picker for profile image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePhotoImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    // Create ToolBar for DatePicker
    private func createToolBarAction() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedAction))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    // Create Date Picker
    private func createDatePicker() {
        dateTextField.textAlignment = .center
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBarAction()
    }
    // Create Done Button for ToolBar and correct text style
    @objc func donePressedAction() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .none
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
        self.dateTextField.text = "\(datePicker.date)"
        self.view.endEditing(true)
    }
    // Add alert to switch
    @objc func afterSwitcherIsOnAlertAction() {
        let switchAlertController = UIAlertController(title: "Спасибо!", message: nil, preferredStyle: .alert)
        let switchAlertAction = UIAlertAction(title: "Ок", style: .default)
        switchAlertController.addAction(switchAlertAction)
        if notifySwitcher.isOn {
            present(switchAlertController, animated: true, completion: nil)
        }
    }
    // Methods to change PP
    @objc func selectProfilePhotoAction() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    // Dismiss Button
    @objc func backToMainMenuAction() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
