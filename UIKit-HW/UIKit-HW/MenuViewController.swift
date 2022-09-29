//
//  MenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Отвечает за выбор пицца или суши
class MenuViewController: UIViewController {
    // Кнопка пицца
    lazy var createPizzaButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        button.center = CGPoint(x: 200, y: 200)
        button.setTitle("Pizza", for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2.0
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(goToPizzaMenuVC), for: .touchUpInside)
        return button
    }()
    // Кнопка суши
    var createSushiButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        button.center = CGPoint(x: 200, y: 350)
        button.setTitle("Shushi", for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2.0
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food"
        cofigureUI()
        removeBackButton()
    }
    private func cofigureUI() {
        view.addSubview(createPizzaButton)
        view.addSubview(createSushiButton)
    }
    // Remove back button from Navigation
    private func removeBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    // Переход в каталог пицц
    @objc private func goToPizzaMenuVC() {
        let pizzaMenuVC = PizzaMenuViewController()
        navigationController?.pushViewController(pizzaMenuVC, animated: true)
    }

}
