//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configNavAndTabBarController()
    }
    func configUI() {
        
    }
    private func configNavAndTabBarController() {
        title = "12 Lesson Label"
        navigationController?.title = "Alone page"
        navigationController?.tabBarItem.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:      #selector(callAlertAction))
    }
    @objc func callAlertAction() {
        let addTextAlertController = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        let addTextAlertAction = UIAlertAction(title: "Готово", style: .default) { _ in
            
        }
        addTextAlertController.addAction(addTextAlertAction)
        addTextAlertController.addTextField(configurationHandler: nil)
        present(addTextAlertController, animated: true, completion: nil)
        print("AAA")
    }
}
