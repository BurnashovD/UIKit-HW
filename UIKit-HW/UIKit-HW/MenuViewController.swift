//
//  MenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Отвечает за выбор пицца или суши
final class MenuViewController: UIViewController {
    // MARK: - Visual components
    lazy var createPizzaButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        button.center = CGPoint(x: 200, y: 200)
        button.setTitle("Pizza", for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2.0
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(goToPizzaMenuVCAction), for: .touchUpInside)
        return button
    }()
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
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
    }
    //MARK: - Public methods
    func cofigureUI() {
        title = "Food"
        removeBackButton()
        view.addSubview(createPizzaButton)
        view.addSubview(createSushiButton)
    }
    // MARK: - Private methods
    // Remove back button from Navigation
    private func removeBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    // Переход в каталог пицц
    @objc private func goToPizzaMenuVCAction() {
        let pizzaMenuVC = PizzaMenuViewController()
        navigationController?.pushViewController(pizzaMenuVC, animated: true)
    }

}
