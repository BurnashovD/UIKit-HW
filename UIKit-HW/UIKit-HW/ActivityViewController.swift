//
//  ActivityViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 01.10.2022.
//

import UIKit
// Принимает текс и перебрасывает на следующий контроллер
final class ActivityViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var field: UITextField!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func segueToNextVC(_ sender: Any) {
        let shooesVC = ShooesViewController()
        shooesVC.text = field.text!
    }
    // MARK: - Public methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "Send" else { return }
            guard let destination = segue.destination as? ShooesViewController else { return }
        destination.text = field.text!
    }
}
