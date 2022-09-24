//
//  ViewController2.swift
//  UIKit-HW
//
//  Created by Daniil on 23.09.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    let switcherBook = UISwitch()
    let labelQuestion = UILabel()
    let payLabel = UILabel()
    let paySwitcher = UISwitch()
    let billLabel = UIButton()
    let thirdVC = BillViewController()
    
    @IBOutlet weak var guestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.switcherBook.frame = CGRect(x: 307, y: 580, width: 0, height: 0)
        self.view.addSubview(switcherBook)
        
        self.labelQuestion.frame = CGRect(x: 49, y: 580, width: 150, height: 30)
        self.labelQuestion.font = UIFont(name: "Ermilov", size: 18.0)
        self.labelQuestion.text = "Есть ли бронь?"
        self.view.addSubview(labelQuestion)
        
        self.payLabel.frame = CGRect(x: 49, y: 630, width: 150, height: 30)
        self.payLabel.font = UIFont(name: "Ermilov", size: 18.0)
        self.payLabel.text = "Предоплата"
        self.view.addSubview(payLabel)
        
        self.paySwitcher.frame = CGRect(x: 307, y: 630, width: 0, height: 0)
        self.view.addSubview(paySwitcher)
    }
    
    @IBAction func guestCounter(_ sender: UIStepper) {
        guestLabel.text = String(sender.value)
    }

    @IBAction func bringBillButton(_ sender: Any) {
        self.goToNext()
    }
    func goToNext() {
        let GoNextAlertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let GoBackAlertAction = UIAlertAction(title: "Назад", style: .default)
        let GoNextAlertAction = UIAlertAction(title: "Да", style: .default) { [self] (secAction) in
            self.present(self.thirdVC, animated: true, completion: nil)
        }
        GoNextAlertController.addAction(GoBackAlertAction)
        GoNextAlertController.addAction(GoNextAlertAction)
        present(GoNextAlertController, animated: true, completion: nil)
    }

}
