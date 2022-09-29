//
//  ViewController2.swift
//  UIKit-HW
//
//  Created by Daniil on 22.09.2022.
//

import UIKit

/*Нужно ввести "leohl" в Алерт нажимаете "ок" отдаете
 контролеру а контролер отдаст это в модель которая
 из буквосочетания "leohl" вернет слово "hello"
 контролеру а контролер отдаст это лейблу и отобразит
 это на экране*/

// Класс преобразует набор букв в слово
class ReturnHelloViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func helloButtonAction(_ sender: Any) {
        self.configuresayHelloAlertController(title: "Введите слово", message: "leohl", style: .alert)
    }
    func configuresayHelloAlertController(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Let's try", style: .default) { _ in
            let hello = Hello()
            self.helloLabel.text = hello.newWord(type: alertController.textFields?.first?.text ?? "")
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
// Возвращает преобразованный hello 
struct Hello {
    func newWord(type: String) -> String {
        guard type != "leohl" else {
            return "hello"
        }
        return "Неверное кодовое слово:)"
   }
}
