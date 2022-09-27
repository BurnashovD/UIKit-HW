//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit

class PracticeActivityViewController: UIViewController {
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var fieldWithPicker: UITextField!
    let numbersArray = ["one", "two", "three"]
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.addTarget(self, action: #selector(tapAndShare), for: .touchUpInside)
        createPickerView()
        fieldWithPicker.addTarget(self, action: #selector(openActivityOnThird), for: .allEditingEvents)
    }
    @objc func tapAndShare() {
        let activityVC = UIActivityViewController(activityItems: [UIImage(named: "spider")!, "Share Spider"], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    @objc func createPickerView() {
        fieldWithPicker.inputView = picker
        
        picker.dataSource = self
        picker.delegate = self
    }
    @objc func openActivityOnThird() {
        if fieldWithPicker.text == numbersArray[2] {
        let activityVC = UIActivityViewController(activityItems: ["Hello there"], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
        }
    }
}

extension PracticeActivityViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbersArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbersArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fieldWithPicker.text = numbersArray[row]
        fieldWithPicker.resignFirstResponder()
    }
}
