//
//  GoalsViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 03.10.2022.
//

import UIKit

// Класс конвертации и подсчета суммы до цели
final class GoalsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var moneyPerMounthLabel: UILabel!
    @IBOutlet weak var convertedMoneyLabel: UILabel!
    @IBOutlet weak var goalMoneyLabel: UILabel!
    @IBOutlet weak var moneySlider: UISlider!
    @IBOutlet weak var valutaTextField: UITextField!
    @IBOutlet weak var mounthsSegmentControl: UISegmentedControl!
    
    // MARK: - Private properties
    private var convertedValue = 0
    private let valutaPickerView = UIPickerView()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        valutaPickerView.delegate = self
        valutaPickerView.dataSource = self
        valutaTextField.inputView = valutaPickerView
        moneySlider.addTarget(self, action: #selector(changeValueAction), for: .allEvents)
        moneySlider.addTarget(self, action: #selector(convertMoneyAction), for: .allEvents)
        mounthsSegmentControl.addTarget(self, action: #selector(selectMounthsCountAction), for: .allEvents)
    }
    
    // MARK: - Private methods
    @objc private func changeValueAction() {
        goalMoneyLabel.text = String(moneySlider.value)
    }
    
    @objc private func convertMoneyAction() {
        switch valutaTextField.text {
        case "₽":
            convertedMoneyLabel.text = "В рублях ~ \(String(moneySlider.value))₽"
            convertedValue = Int(moneySlider.value)
        case "€":
            convertedMoneyLabel.text = "В рублях ~ \(String(Int(moneySlider.value) * 58))₽"
            convertedValue = Int(moneySlider.value) * 58
        case "$":
            convertedMoneyLabel.text = "В рублях ~ \(String(Int(moneySlider.value) * 59))₽"
            convertedValue = Int(moneySlider.value) * 59
        case "₺":
            convertedMoneyLabel.text = "В рублях ~ \(String(Double(moneySlider.value) * 3.2))₽"
            convertedValue = Int(moneySlider.value) * 3
        default:
            break
        }
    }
    
    @objc private func selectMounthsCountAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            moneyPerMounthLabel.text = String(convertedValue / 3)
        case 1:
            moneyPerMounthLabel.text = String(convertedValue / 6)
        case 2:
            moneyPerMounthLabel.text = String(convertedValue / 9)
        default:
            return
        }
    }
}

private extension GoalsViewController {
    enum Constants {
        static let differentValuta = ["₽", "€", "$", "₺"]
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension GoalsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.differentValuta.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.differentValuta[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valutaTextField.text = "\(Constants.differentValuta[row])"
        valutaTextField.resignFirstResponder()
    }
}
