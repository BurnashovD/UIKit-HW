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
    private lazy var differentTextLabel: UILabel = {
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
    
    private lazy var fontSizeSlider: UISlider = {
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
    
    private lazy var chooseTextColorTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 230, height: 35)
        field.center = CGPoint(x: 200, y: 650)
        field.backgroundColor = .link
        field.placeholder = "Выберете цвет текста"
        field.textAlignment = .center
        field.layer.cornerRadius = 5
        return field
    }()
    
    private let chooseLinesTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 230, height: 35)
        field.center = CGPoint(x: 200, y: 700)
        field.backgroundColor = .link
        field.placeholder = "Выберите кол-во строк"
        field.textAlignment = .center
        field.layer.cornerRadius = 5
        return field
    }()
    
    // MARK: - Private properties
    private let colors = ["blue", "red", "gray", "orange", "yellow", "black"]
    private let linesNumbers = Array(0...10)
    private let labelTextColorPickerView = UIPickerView()
    private let labelLinesPickerView = UIPickerView()
    
    // MARK: - LifeCycle
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
    
    @objc private func callAlertAction() {
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
            return linesNumbers.count
        case 2:
            return colors.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return String(linesNumbers[row])
        case 2:
            return colors[row]
        default:
            return "Not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            chooseLinesTextField.text = String(linesNumbers[row])
            differentTextLabel.numberOfLines = linesNumbers[row]
            chooseLinesTextField.resignFirstResponder()
        case 2:
            chooseTextColorTextField.text = colors[row]
            differentTextLabel.textColor = UIColor(named: colors[row])
            chooseTextColorTextField.resignFirstResponder()
        default:
            return
        }
    }
}
