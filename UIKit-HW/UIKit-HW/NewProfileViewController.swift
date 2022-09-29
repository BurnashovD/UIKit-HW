//
//  NewProfileViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 25.09.2022.
//

import UIKit
// Контроллер отвечает за добавление нового профиля
class NewProfileViewController: UIViewController {
    
    let picker = UIPickerView()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 305, width: 100, height: 20)
        label.text = "Имя"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    lazy var textForName: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 50, y: 330, width: 320, height: 35)
        field.autocorrectionType = .no
        field.placeholder = "Укажите имя"
        return field
    }()
    let lineUnderNameText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 365, width: 320, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 400, width: 100, height: 20)
        label.text = "Дата"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 500, width: 100, height: 20)
        label.text = "Возраст"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    let sexLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 600, width: 100, height: 20)
        label.text = "Пол"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    let instagramLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 700, width: 100, height: 20)
        label.text = "Instagram"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    let dateTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 50, y: 430, width: 320, height: 35)
        field.autocorrectionType = .no
        field.placeholder = "Укажите дату рождения"
        return field
    }()
    let lineUnderDateText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 465, width: 320, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let datePicker = UIDatePicker()
    let ageTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 50, y: 530, width: 320, height: 35)
        field.autocorrectionType = .no
        field.placeholder = "Укажите возраст"
        return field
    }()
    let lineUnderAgeText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 565, width: 320, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let agesArray: [Int] = Array(7...100)
    let agesPickerView = UIPickerView()
    let sexTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 50, y: 630, width: 320, height: 35)
        field.autocorrectionType = .no
        field.placeholder = "Укажите пол"
        return field
    }()
    let lineUnderSexText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 665, width: 320, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let sexPickerView = UIPickerView()
    let sexArray = ["Man", "Women", "Pet"]
    let instagramTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 50, y: 730, width: 320, height: 35)
        field.autocorrectionType = .no
        field.placeholder = "Укажите профиль пользователя"
        field.addTarget(self, action: #selector(addInstagramAlert), for: .allEvents)
        return field
    }()
    let lineUnderInstagramText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 50, y: 765, width: 320, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let addNewProfileButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 315, y: 18, width: 90, height: 30)
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(addNewProfileAndReturnToMainVC), for: .allEvents)
        return button
    }()
    let chooseProfileNumberLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 170, y: 240, width: 300, height: 30)
        label.text = "Номер профиля:"
        label.font = UIFont(name: "DIN Alternate", size: 17)
        return label
    }()
    let chooseProfileNumberText: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 300, y: 240, width: 20, height: 30)
        field.placeholder = "0"
        return field
    }()
    let steper = UIStepper()

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        agesPickerView.delegate = self
        agesPickerView.dataSource = self
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        
        ageTextField.inputView = agesPickerView
        sexTextField.inputView = sexPickerView
    }
    func configUI() {
        view.addSubview(nameLabel)
        view.addSubview(textForName)
        view.addSubview(lineUnderNameText)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(lineUnderDateText)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(lineUnderAgeText)
        view.addSubview(sexLabel)
        view.addSubview(sexTextField)
        view.addSubview(lineUnderSexText)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        view.addSubview(lineUnderInstagramText)
        view.addSubview(addNewProfileButton)
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
        present(instagramAlertController, animated: true, completion: nil)
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
