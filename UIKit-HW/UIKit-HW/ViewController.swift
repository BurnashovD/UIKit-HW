//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelWithName: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
//    @IBOutlet weak var labelWithName: UILabel!
    @IBOutlet weak var summaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func nameButton(_ sender: Any) {
        self.labelWithName.text = "Привет, "
        self.alert(title: "Здравствуйте!", message: "Введите имя", style: .alert)
    }
    // MARK: - Label with name
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Готово", style: .default) { (action) in
            let texta = alertController.textFields?.first
            self.labelWithName.text! += texta?.text ?? "Имя не получено"
        }
        alertController.addTextField { (texta) in
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func mathButton(_ sender: Any) {
        self.math()
        // MARK: - Math GAME
    }
    func math() {
        let alertControl = UIAlertController(title: "Введите числа", message: nil , preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Готово", style: .default ) { (firstAlertAction) in
            let firstNum = Int(alertControl.textFields?[0].text ?? "")
            let secondNum = Int(alertControl.textFields?[1].text ?? "")
            self.summaLabel.text! = "Сумма чисел = \(String(firstNum! + secondNum!))"
        }

        alertControl.addTextField(configurationHandler: nil)
        alertControl.addTextField(configurationHandler: nil)
        alertControl.addAction(alertAction)
        self.present(alertControl, animated: true, completion: nil)

    }
    @IBAction func guessGameButton(_ sender: Any) {
        self.guess()
    }

        // MARK: - Guess a number game
func guess() {
    let alertCtrl = UIAlertController(title: "Угадай число!", message: "Введи число от 1 до 10", preferredStyle: .alert)
    let alertActn = UIAlertAction(title: "Угадать!", style: .default) { (guessNum) in
        let newNumber = Int.random(in: 0...10)
        let userNumber = Int(alertCtrl.textFields?.first?.text ?? "error")
        if userNumber == newNumber {
            self.guessLabel.text = "Поздравляю! Ты угадал!"
        } else {
            self.guessLabel.text = "Неверно! Загаданное число = \(newNumber)"
        }
    }
    alertCtrl.addTextField(configurationHandler: nil)
    alertCtrl.addAction(alertActn)
    self.present(alertCtrl, animated: true, completion: nil)
}
}
