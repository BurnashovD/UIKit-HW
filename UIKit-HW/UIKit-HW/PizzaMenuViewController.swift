//
//  PizzaMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Отвечает за выбор пиццы
final class PizzaMenuViewController: UIViewController {
    // MARK: - Visual components
    lazy var pizzaMargharitaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "marga")
        imageView.frame = CGRect(x: 40, y: 150, width: 130, height: 130)
        return imageView
    }()
    lazy var pizzaPepperoniImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pepperoni")
        imageView.frame = CGRect(x: 40, y: 300, width: 130, height: 130)
        return imageView
    }()
    lazy var createMargharittaLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 180, y: 200, width: 200, height: 30)
        label.text = "Маргарита"
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 25)
        return label
    }()
    lazy var createPepperoniLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 185, y: 350, width: 200, height: 30)
        label.text = "Пепперони"
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 25)
        return label
    }()
    lazy var createMargharittaButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 400, height: 150)
        button.center = CGPoint(x: 200, y: 210)
        button.addTarget(self, action: #selector(goToMargharittaIngredientsAction), for: .touchUpInside)
        return button
    }()
    lazy var createPepperoniButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 400, height: 150)
        button.center = CGPoint(x: 200, y: 370)
        button.addTarget(self, action: #selector(goToPepperoniIngredientsAction), for: .touchUpInside)
        return button
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cofigureUI()
    }
    // MARK: Public Methods
    func cofigureUI() {
        title = "Pizza"
        view.addSubview(pizzaMargharitaImageView)
        view.addSubview(pizzaPepperoniImageView)
        view.addSubview(createMargharittaLabel)
        view.addSubview(createPepperoniLabel)
        view.addSubview(createMargharittaButton)
        view.addSubview(createMargharittaButton)
        view.addSubview(createPepperoniButton)
    }
    // MARK: - Private Methods
    // Переход к выбору ингредиентов Маргариты
    @objc private func goToMargharittaIngredientsAction() {
        let margharittaVC = MargharittaIngredientsViewController()
        present(margharittaVC, animated: true, completion: nil)
    }
    // Переход к выбору ингредиентов Пепперони
    @objc private func goToPepperoniIngredientsAction() {
        let pepperoniVC = PepperoniIngredientsViewController()
        present(pepperoniVC, animated: true, completion: nil)
    }
}
