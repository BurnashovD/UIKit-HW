//
//  NewProfileViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 25.09.2022.
//

import UIKit

class NewProfileViewController: UIViewController {
    
    let picker = UIPickerView()
    let nameLabel = UILabel()
    let textForName = UITextField()
    let lineUnderNameText = UIView()
    let dateLabel = UILabel()
    let ageLabel = UILabel()
    let sexLabel = UILabel()
    let instagramLabel = UILabel()
    let dateTextField = UITextField()
    let lineUnderDateText = UIView()
    let datePicker = UIDatePicker()
    let ageTextField = UITextField()
    let lineUnderAgeText = UIView()
    let agesArray: [Int] = Array(7...100)
    let agesPickerView = UIPickerView()
    let sexTextField = UITextField()
    let lineUnderSexText = UIView()
    let sexPickerView = UIPickerView()
    let sexArray = ["Man", "Women", "Pet"]
    let instagramTextField = UITextField()
    let lineUnderInstagramText = UIView()
    let addNewProfileButton = UIButton()
    let chooseProfileNumberLabel = UILabel()
    let chooseProfileNumberText = UITextField()
    let steper = UIStepper()

    override func viewDidLoad() {
        super.viewDidLoad()

        agesPickerView.delegate = self
        agesPickerView.dataSource = self
        ageTextField.inputView = agesPickerView
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        sexTextField.inputView = sexPickerView
        // MARK: - Label and TextField for name
        nameLabel.frame = CGRect(x: 50, y: 305, width: 100, height: 20)
        nameLabel.text = "Имя"
        nameLabel.font = UIFont(name: "DIN Alternate", size: 17)
        view.addSubview(nameLabel)
        textForName.frame = CGRect(x: 50, y: 330, width: 320, height: 35)
        textForName.autocorrectionType = .no
        textForName.placeholder = "Укажите имя"
        lineUnderNameText.frame = CGRect(x: 50, y: 365, width: 320, height: 1)
        lineUnderNameText.backgroundColor = .lightGray
        view.addSubview(textForName)
        view.addSubview(lineUnderNameText)
        // MARK: - Label and UIDatePicker for date
        dateLabel.frame = CGRect(x: 50, y: 400, width: 100, height: 20)
        dateLabel.text = "Дата"
        dateLabel.font = UIFont(name: "DIN Alternate", size: 17)
        view.addSubview(dateLabel)
        dateTextField.frame = CGRect(x: 50, y: 430, width: 320, height: 35)
        dateTextField.autocorrectionType = .no
        dateTextField.placeholder = "Укажите дату рождения"
        lineUnderDateText.frame = CGRect(x: 50, y: 465, width: 320, height: 1)
        lineUnderDateText.backgroundColor = .lightGray
        view.addSubview(dateTextField)
        view.addSubview(lineUnderDateText)
        createDatePicker()
        // MARK: - Label for age
        ageLabel.frame = CGRect(x: 50, y: 500, width: 100, height: 20)
        ageLabel.text = "Возраст"
        ageLabel.font = UIFont(name: "DIN Alternate", size: 17)
        view.addSubview(ageLabel)
        ageTextField.frame = CGRect(x: 50, y: 530, width: 320, height: 35)
        ageTextField.autocorrectionType = .no
        ageTextField.placeholder = "Укажите возраст"
        lineUnderAgeText.frame = CGRect(x: 50, y: 565, width: 320, height: 1)
        lineUnderAgeText.backgroundColor = .lightGray
        view.addSubview(ageTextField)
        view.addSubview(lineUnderAgeText)
        // MARK: - Label for sex
        sexLabel.frame = CGRect(x: 50, y: 600, width: 100, height: 20)
        sexLabel.text = "Пол"
        sexLabel.font = UIFont(name: "DIN Alternate", size: 17)
        view.addSubview(sexLabel)
        sexTextField.frame = CGRect(x: 50, y: 630, width: 320, height: 35)
        sexTextField.autocorrectionType = .no
        sexTextField.placeholder = "Укажите пол"
        lineUnderSexText.frame = CGRect(x: 50, y: 665, width: 320, height: 1)
        lineUnderSexText.backgroundColor = .lightGray
        view.addSubview(sexTextField)
        view.addSubview(lineUnderSexText)
        // MARK: - Label for Instagram
        instagramLabel.frame = CGRect(x: 50, y: 700, width: 100, height: 20)
        instagramLabel.text = "Instagram"
        instagramLabel.font = UIFont(name: "DIN Alternate", size: 17)
        view.addSubview(instagramLabel)
        instagramTextField.frame = CGRect(x: 50, y: 730, width: 320, height: 35)
        instagramTextField.autocorrectionType = .no
        instagramTextField.placeholder = "Укажите профиль пользователя"
        lineUnderInstagramText.frame = CGRect(x: 50, y: 765, width: 320, height: 1)
        lineUnderInstagramText.backgroundColor = .lightGray
        instagramTextField.addTarget(self, action: #selector(addInstagramAlert), for: .allEvents)
        view.addSubview(instagramTextField)
        view.addSubview(lineUnderInstagramText)
        // MARK: - Add button
        addNewProfileButton.frame = CGRect(x: 315, y: 18, width: 90, height: 30)
        addNewProfileButton.setTitle("Добавить", for: .normal)
        addNewProfileButton.setTitleColor(.link, for: .normal)
        addNewProfileButton.addTarget(self, action: #selector(addNewProfileAndReturnToMainVC), for: .allEvents)
        view.addSubview(addNewProfileButton)
        // MARK: - Choose number of adding profile
        chooseProfileNumberLabel.frame = CGRect(x: 170, y: 240, width: 300, height: 30)
        chooseProfileNumberLabel.text = "Номер профиля:"
        chooseProfileNumberLabel.font = UIFont(name: "DIN Alternate", size: 17)
        chooseProfileNumberText.frame = CGRect(x: 300, y: 240, width: 20, height: 30)
        chooseProfileNumberText.placeholder = "0"

        view.addSubview(chooseProfileNumberText)
        view.addSubview(chooseProfileNumberLabel)
    }
    // MARK: - Methods which creates DatePicker
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: nil, action: #selector(donePressedForDatePicker))
        toolBar.setItems([doneButton], animated: true)
        return toolBar
    }
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    @objc func donePressedForDatePicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    // MARK: - Alert which add Instagram nick
    @objc func addInstagramAlert() {
        let instagramAlertController = UIAlertController(title: "Введите имя пользователя",
                                                         message: nil, preferredStyle: .alert)
        let instagramAlertAction = UIAlertAction(title: "Ok", style: .default) {(_) in
            self.instagramTextField.text = instagramAlertController.textFields?.first?.text
                }
        instagramAlertController.addTextField(configurationHandler: nil)
        instagramAlertController.addAction(instagramAlertAction)
        self.present(instagramAlertController, animated: true, completion: nil)
    }
    // MARK: - add Button Method
     @objc func addNewProfileAndReturnToMainVC() -> String {
         let mainVC = MainViewController()
         switch chooseProfileNumberText.text {
         case "1":
             mainVC.firstProfileNameLabel.text = textForName.text
             mainVC.firstProfileDateLabel.text = "\(dateTextField.text ?? "") будет \(ageTextField.text ?? "")"
         case "2":
             mainVC.secondProfileNameLabel.text = textForName.text
             mainVC.secondProfileDateLabel.text = "\(dateTextField.text ?? "") будет \(ageTextField.text ?? "")"
         case "3":
             mainVC.thirdProfileNameLabel.text = textForName.text
             mainVC.thirdProfileDateLabel.text = "\(dateTextField.text ?? "") будет \(ageTextField.text ?? "")"
         case "4":
             mainVC.fourProfileNameLabel.text = textForName.text
             mainVC.fourProfileDateLabel.text = "\(dateTextField.text ?? "") будет \(ageTextField.text ?? "")"
         default:
             return ""
         }
        dismiss(animated: true, completion: nil)
         return ""
    }
}
   // MARK: - Creates Picker for age
extension NewProfileViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return agesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(agesArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = String(agesArray[row])
        ageTextField.resignFirstResponder()
    }
}
