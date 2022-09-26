//
//  ViewController2.swift
//  UIKit-HW
//
//  Created by Daniil on 23.09.2022.
//

import UIKit
// Класс регистрации гостя
class RegistrationViewController: UIViewController {

    let bookSwitcher = UISwitch()
    let questionLabel = UILabel()
    let payLabel = UILabel()
    let paySwitcher = UISwitch()
    let billButton = UIButton()
    let thirdVC = BillViewController()
    @IBOutlet weak var guestLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookSwitcher.frame = CGRect(x: 307, y: 580, width: 0, height: 0)
        view.addSubview(bookSwitcher)
        questionLabel.frame = CGRect(x: 49, y: 580, width: 150, height: 30)
        questionLabel.font = UIFont(name: "Ermilov", size: 18.0)
        questionLabel.text = "Есть ли бронь?"
        view.addSubview(questionLabel)
        payLabel.frame = CGRect(x: 49, y: 630, width: 150, height: 30)
        payLabel.font = UIFont(name: "Ermilov", size: 18.0)
        payLabel.text = "Предоплата"
        view.addSubview(payLabel)
        paySwitcher.frame = CGRect(x: 307, y: 630, width: 0, height: 0)
        view.addSubview(paySwitcher)
    }
    @IBAction func guestCounter(_ sender: UIStepper) {
        guestLabel.text = String(sender.value)
    }

    @IBAction func bringBillButton(_ sender: Any) {
        self.configureGoToNextAlertController()
    }
    func configureGoToNextAlertController() {
        let goNextAlertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let goBackAlertAction = UIAlertAction(title: "Назад", style: .default)
        let goNextAlertAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.present(self.thirdVC, animated: true, completion: nil)
        }
        goNextAlertController.addAction(goBackAlertAction)
        goNextAlertController.addAction(goNextAlertAction)
        present(goNextAlertController, animated: true, completion: nil)
    }

}
