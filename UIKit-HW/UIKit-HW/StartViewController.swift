//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI() {
        title = "Start VC"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action:
                                                            #selector(goToSecondVC))
    }
    
    @objc private func goToSecondVC() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
