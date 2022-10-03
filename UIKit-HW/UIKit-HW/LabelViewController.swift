//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Класс с конфигурацией Лейбла
final class LabelViewController: UIViewController {
    // MARK: - Visual components
    lazy var differentTextLabel: UILabel = {
        let label = UILabel()
        let fontValue = CGFloat(fontSizeSlider.value)
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 170)
        label.center = view.center
        label.font = UIFont(name: "Rockwell", size: fontValue)
        label.numberOfLines = 0
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.shadowColor = .systemPink
        label.shadowOffset = CGSize(width: 3, height: 3)
        label.textAlignment = .center
        return label
    }()
    
    lazy var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        slider.center = CGPoint(x: 200, y: 600)
        slider.thumbTintColor = .purple
        slider.minimumValueImage = UIImage(systemName: "text.cursor")
        slider.maximumValue = 40
        slider.minimumValue = 5.0
        slider.value = 1.0
        slider.addTarget(self, action: #selector(changeFontSizeAction), for: .allEvents)
        return slider
    }()
    
    lazy var chooseTextColorTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 230, height: 35)
        field.center = CGPoint(x: 200, y: 650)
        field.backgroundColor = .link
        field.placeholder = "Выберете цвет текста"
        field.textAlignment = .center
        field.layer.cornerRadius = 5
        return field
    }()
    
    let chooseLinesTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 230, height: 35)
        field.center = CGPoint(x: 200, y: 700)
        field.backgroundColor = .link
        field.placeholder = "Выберите кол-во строк"
        field.textAlignment = .center
        field.layer.cornerRadius = 5
        return field
    }()
    
    // MARK: - Public properties
    let colorsArray = ["blue", "red", "gray", "orange", "yellow", "black"]
    let linesNumbersArray = Array(0...10)
    let labelTextColorPickerView = UIPickerView()
    let labelLinesPickerView = UIPickerView()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configNavAndTabBarController()
        configPickers()
    }
    
    // MARK: - Public methods
    func configUI() {
        view.addSubview(differentTextLabel)
        view.addSubview(fontSizeSlider)
        view.addSubview(chooseTextColorTextField)
        view.addSubview(chooseLinesTextField)
    }
    
    func configPickers() {
        labelLinesPickerView.delegate = self
        labelLinesPickerView.dataSource = self
        labelTextColorPickerView.delegate = self
        labelTextColorPickerView.dataSource = self
        chooseTextColorTextField.inputView = labelTextColorPickerView
        chooseLinesTextField.inputView = labelLinesPickerView
        labelLinesPickerView.tag = 1
        labelTextColorPickerView.tag = 2
    }
    
    // MARK: - Private methods
    private func configNavAndTabBarController() {
        title = "12 Lesson Label"
        navigationController?.title = "Alone page"
        navigationController?.tabBarItem.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(callAlertAction))
    }
    
    @objc func callAlertAction() {
        let addTextAlertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let addTextAlertAction = UIAlertAction(title: "Готово", style: .default) { _ in
            self.differentTextLabel.text = addTextAlertController.textFields?.first?.text
        }
        addTextAlertController.addAction(addTextAlertAction)
        addTextAlertController.addTextField(configurationHandler: nil)
        present(addTextAlertController, animated: true, completion: nil)
    }
    
    @objc private func changeFontSizeAction() {
        differentTextLabel.font = UIFont(name: "Rockwell", size: CGFloat(fontSizeSlider.value))
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension LabelViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return linesNumbersArray.count
        case 2:
            return colorsArray.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return String(linesNumbersArray[row])
        case 2:
            return colorsArray[row]
        default:
            return "Not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            chooseLinesTextField.text = String(linesNumbersArray[row])
            differentTextLabel.numberOfLines = linesNumbersArray[row]
            chooseLinesTextField.resignFirstResponder()
        case 2:
            chooseTextColorTextField.text = colorsArray[row]
            differentTextLabel.textColor = UIColor(named: colorsArray[row])
            chooseTextColorTextField.resignFirstResponder()
        default:
            return
        }
    }
}
