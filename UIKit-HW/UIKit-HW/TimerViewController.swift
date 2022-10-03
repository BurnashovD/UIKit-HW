//
//  TimerViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 01.10.2022.
//

import UIKit
// Таймер
final class TimerViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stopView: UIView!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var timerPicker: UIPickerView!
    
    // MARK: - Public propetys
    var hours: Int = 0
    var minuties: Int = 0
    var seconds: Int = 0
    var timer = Timer()
    var isTimerRunning = false
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    // MARK: - Public methods
    func configUI() {
        timerPicker.dataSource = self
        timerPicker.delegate = self
        timerPicker.setValue(UIColor.white, forKey: "textColor")
        startView.layer.cornerRadius = 0.5 * startView.bounds.size.width
        stopView.layer.cornerRadius = 0.5 * stopView.bounds.size.width
        stopButton.layer.cornerRadius = 0.5 * stopButton.bounds.size.width
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        stopButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 2
        stopButton.layer.borderWidth = 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Timer" else { return }
        guard let destination = segue.destination as? RealizeTimerViewController else { return }
        destination.seconds = seconds
        destination.minuties = minuties
    }
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) ч"
        case 1:
            return "\(row) мин"
        case 2:
            return "\(row) с"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minuties = row
        case 2:
            seconds = row
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
                 return pickerView.frame.size.width/3
    }
}
