//
//  ProfileViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 27.09.2022.
//

import UIKit
// Класс отвечает за профиль пользователя
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let profilePhotoImageView = UIImageView()
    let changeProfilePhotoButton = UIButton()
    let backToMainMenuButton = UIButton()
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let lineUnderNameText = UIView()
    let dateLabel = UILabel()
    let dateTextField = UITextField()
    let lineUnderDateText = UIView()
    let datePicker = UIDatePicker()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let lineUnderEmailText = UIView()
    let notifyLabel = UILabel()
    let notifySwitcher = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // MARK: - Add ImageView for profile photo
        profilePhotoImageView.frame = CGRect(x: 140, y: 80, width: 130, height: 130)
        profilePhotoImageView.backgroundColor = .white
        profilePhotoImageView.layer.cornerRadius = 50
        view.addSubview(profilePhotoImageView)
        // MARK: - Button to change PP
        changeProfilePhotoButton.frame = CGRect(x: 75, y: 230, width: 250, height: 20)
        changeProfilePhotoButton.setTitle("Изменить фото профиля", for: .normal)
        changeProfilePhotoButton.addTarget(self, action: #selector(selectProfilePhoto), for: .touchUpInside)
        view.addSubview(changeProfilePhotoButton)
        // MARK: - Add button back to menu
        backToMainMenuButton.frame = CGRect(x: 15, y: 10, width: 50, height: 50)
        backToMainMenuButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backToMainMenuButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        view.addSubview(backToMainMenuButton)
        // MARK: - Name Label
        nameLabel.frame = CGRect(x: 183, y: 260, width: 100, height: 100)
        nameLabel.text = "Name"
        nameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        // MARK: - Add TextField for name and line under
        nameTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        nameTextField.center = CGPoint(x: 200, y: 350)
        nameTextField.autocorrectionType = .no
        nameTextField.placeholder = "Введите имя"
        nameTextField.textAlignment = .center
        nameTextField.textColor = .white
        nameTextField.font = UIFont(name: "American Typewriter", size: 20)
        lineUnderNameText.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        lineUnderNameText.center = CGPoint(x: 200, y: 360)
        lineUnderNameText.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(lineUnderNameText)
        //MARK: - Add Label and TextField for date
        dateLabel.frame = CGRect(x: 175, y: 365, width: 300, height: 50)
        dateLabel.text = "Birthday"
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        dateTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        dateTextField.center = CGPoint(x: 200, y: 430)
        dateTextField.autocorrectionType = .no
        dateTextField.placeholder = "Выберите дату"
        dateTextField.textAlignment = .center
        dateTextField.textColor = .white
        dateTextField.font = UIFont(name: "American Typewriter", size: 20)
        lineUnderDateText.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        lineUnderDateText.center = CGPoint(x: 200, y: 440)
        lineUnderDateText.backgroundColor = .white
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(lineUnderDateText)
        // MARK: - Add Label and TextField for Email
        emailLabel.frame = CGRect(x: 185, y: 445, width: 300, height: 50)
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        emailLabel.textColor = .white
        view.addSubview(emailLabel)
        emailTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        emailTextField.center = CGPoint(x: 200, y: 510)
        emailTextField.placeholder = "Укажите почту"
        emailTextField.textAlignment = .center
        emailTextField.textColor = .white
        emailTextField.font = UIFont(name: "American Typewriter", size: 20)
        lineUnderEmailText.frame = CGRect(x: 0, y: 0, width: 300, height: 1)
        lineUnderEmailText.backgroundColor = .white
        lineUnderEmailText.center = CGPoint(x: 200, y: 520)
        view.addSubview(lineUnderEmailText)
        view.addSubview(emailTextField)
        //MARK: - Adding delivery Label to Switch
        notifyLabel.frame = CGRect(x: 120, y: 600, width: 300, height: 30)
        notifyLabel.text = "Включить уведомления"
        notifyLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        notifyLabel.textColor = .white
        view.addSubview(notifyLabel)
        // MARK: - Add notify Switch
        notifySwitcher.frame = CGRect(x: 310, y: 600, width: 60, height: 60)
        notifySwitcher.addTarget(self, action: #selector(alertAfterSwitcherIsOn), for: .valueChanged)
        view.addSubview(notifySwitcher)
    }
    // MARK: - Methods to change PP
    @objc func selectProfilePhoto() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    // MARK: - Method add Picker for profile image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePhotoImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Dismiss Button
    @objc func backToMainMenu() {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Create ToolBar for DatePicker
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    // MARK: - Create Date Picker
    func createDatePicker() {
        dateTextField.textAlignment = .center
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    // MARK: - Create Done Button for ToolBar and correct text style
    @objc func donePressed() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .none
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
        self.dateTextField.text = "\(datePicker.date)"
        self.view.endEditing(true)
    }
    // MARK: - Add alert to switch
    @objc func alertAfterSwitcherIsOn() {
        let switchAlertController = UIAlertController(title: "Спасибо!", message: nil, preferredStyle: .alert)
        let switchAlertAction = UIAlertAction(title: "Ок", style: .default)
        switchAlertController.addAction(switchAlertAction)
        if notifySwitcher.isOn {
            present(switchAlertController, animated: true, completion: nil)
        }
    }
}
