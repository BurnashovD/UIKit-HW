//
//  ReportViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 29.09.2022.
//

import UIKit
// Отвечает за отзыв и оценку
class ReportViewController: UIViewController {
    let ratingArray = ["1", "2", "3", "4", "5"]
    let ratingPicker = UIPickerView()
    lazy var reportLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 120, width: 200, height: 40)
        label.text = "Оставьте отзыв:"
        label.font = UIFont(name: "Marker Felt Thin", size: 20)
        return label
    }()
    lazy var reportTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 370, height: 400)
        field.center = view.center
        field.placeholder = "Введите текст"
        field.textAlignment = .center
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 2.0
        return field
    }()
    lazy var pickerTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        field.center = CGPoint(x: 200, y: 700)
        field.placeholder = "Поставьте оценку"
        field.textAlignment = .center
        return field
    }()
    lazy var finishButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        button.center = CGPoint(x: 200, y: 760)
        button.layer.cornerRadius = 5
        button.backgroundColor = .orange
        button.setTitle("Отправить отзыв", for: .normal)
        button.addTarget(self, action: #selector(returnToMenu), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        pickerTextField.inputView = ratingPicker
        
        ratingPicker.delegate = self
        ratingPicker.dataSource = self
    }
    private func cofigureUI() {
        view.addSubview(reportLabel)
        view.addSubview(reportTextField)
        view.addSubview(pickerTextField)
        view.addSubview(finishButton)
    }
    @objc func returnToMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let menuVC = storyboard.instantiateViewController(withIdentifier: "Menu") as? MenuViewController else { return }
        menuVC.modalPresentationStyle = .fullScreen
        self.show(menuVC, sender: nil)
    }
}
// Расширение для пикера
extension ReportViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return ratingArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return ratingArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = "\(ratingArray[row]) \u{1F31F}"
        pickerTextField.resignFirstResponder()
    }
}
