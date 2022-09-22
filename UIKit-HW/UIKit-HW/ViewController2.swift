//
//  ViewController2.swift
//  UIKit-HW
//
//  Created by Daniil on 22.09.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func helloButton(_ sender: Any) {
        self.sayHello(title: "Введите слово", message: "leohl", style: .alert)
    }
    
    func sayHello(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Let's try", style: .default) { (action) in
            let hello = Hello()
            self.helloLabel.text = hello.newWord(type: alertController.textFields?.first?.text ?? "")
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

}

//struct Hello {
//
//    var mvc = ViewController2()
//
//    func newWord(type: String) {
//        if type == "leohl" {
//            self.mvc.helloLabel?.text = "hello"
//        } else {
//            self.mvc.helloLabel?.text = "Введите кодовое слово:)"
//        }
//    }
//}

struct Hello {
    var mvc = ViewController2()
    func newWord(type: String) -> String {
        if type == "leohl" {
            return "hello"
        } else {
            return "Неверное кодовое слово:)"
        }
    }
}
