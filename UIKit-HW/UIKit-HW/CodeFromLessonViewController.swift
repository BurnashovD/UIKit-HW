//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Повтор кода из урока
class CodeFromLessonViewController: UIViewController {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
        
    }
// MARK: - Methods
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Enter text to share"
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    
    @objc func hendleShare(paramSender: Any) {
        let text = textField.text
        
        if text?.count == 0 {
            let message = "Cначала введите текст, потом нажмите кнопку"
            let alertControl = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertControl.addAction(action)
            present(alertControl, animated: true, completion: nil)
        }
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        present(activityViewController!, animated: true, completion: nil)
    }
}
