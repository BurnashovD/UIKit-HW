//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit

class MathAndGameViewController: UIViewController {

    @IBOutlet weak var labelWithName: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var summaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func nameButton(_ sender: Any) {
        labelWithName.text = "Привет, "
        askName(title: "Здравствуйте!", message: "Введите имя", style: .alert)
    }
    // MARK: - Label with name
    func askName(title: String, message: String, style: UIAlertController.Style) {
        let labelNameAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let presentName = UIAlertAction(title: "Готово", style: .default) { (_) in
            let texta = labelNameAlertController.textFields?.first
            self.labelWithName.text! += texta?.text ?? "Имя не получено"
        }
        labelNameAlertController.addTextField { (_) in
        }
        labelNameAlertController.addAction(presentName)
        self.present(labelNameAlertController, animated: true, completion: nil)
    }
    // MARK: - Math Game
    @IBAction func mathButton(_ sender: Any) {
        math()
    }
    func math() {
        let alertControl = UIAlertController(title: "Введите числа", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Готово", style: .default ) { (_) in
            let firstNum = Int(alertControl.textFields?[0].text ?? "")
            let secondNum = Int(alertControl.textFields?[1].text ?? "")
            self.summaLabel.text! = "Сумма чисел = \(String(firstNum! + secondNum!))"
        }

        alertControl.addTextField(configurationHandler: nil)
        alertControl.addTextField(configurationHandler: nil)
        alertControl.addAction(alertAction)
        present(alertControl, animated: true, completion: nil)

    }
    // MARK: - Guess a number game
    @IBAction func guessGameButton(_ sender: Any) {
        guessANumber()
    }

func guessANumber() {
    let guessNumberAlertController = UIAlertController(title: "Угадай число!",
                                                     message: "Введи число от 1 до 10", preferredStyle: .alert)
    let guessNumberAlertAction = UIAlertAction(title: "Угадать!", style: .default) { (_) in
        let randomNumber = Int.random(in: 0...10)
        let userNumber = Int(guessNumberAlertController.textFields?.first?.text ?? "error")
        if userNumber == randomNumber {
            self.guessLabel.text = "Поздравляю! Ты угадал!"
        } else {
            self.guessLabel.text = "Неверно! Загаданное число = \(randomNumber)"
        }
    }
    guessNumberAlertController.addTextField(configurationHandler: nil)
    guessNumberAlertController.addAction(guessNumberAlertAction)
    self.present(guessNumberAlertController, animated: true, completion: nil)
}
}
