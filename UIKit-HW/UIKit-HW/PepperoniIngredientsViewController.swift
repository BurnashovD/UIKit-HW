//
//  PepperoniIngredientsViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Выбор ингредиентов Пепперони
class PepperoniIngredientsViewController: UIViewController {
    var pizzaOrder = "Пицца Пепперони с: "
    lazy var addPepperoniImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pepperoni")
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = CGPoint(x: 200, y: 200)
        return imageView
    }()
    lazy var addPepperoniLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 45)
        label.center = CGPoint(x: 210, y: 400)
        label.text = "Пепперони"
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 40)
        return label
    }()
    // Cheese Switch
    lazy var addCheeseSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 460, width: 100, height: 100)
        return switcher
    }()
    // Ham Switch
    lazy var addHamSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 520, width: 100, height: 100)
        return switcher
    }()
    // Mashrooms Switch
    lazy var addMashroomsSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 580, width: 100, height: 100)
        return switcher
    }()
    // Olive Switch
    lazy var addOliveSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 640, width: 100, height: 100)
        return switcher
    }()
    lazy var addChooeseButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        button.center = CGPoint(x: 200, y: 730)
        button.backgroundColor = .orange
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(takeAnOrderAndSendToCart), for: .touchUpInside)
        return button
    }()
    lazy var addBackButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 15, width: 50, height: 50)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.addTarget(self, action: #selector(returnToPizzaMenu), for: .touchUpInside)
        return button
    }()
    lazy var ingredienСheeseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 425, width: 140, height: 100)
        label.text = "Сыр моцарела"
        label.font = UIFont(name: "Georgia", size: 15)
        return label
    }()
    lazy var ingredienHamsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 485, width: 140, height: 100)
        label.text = "Ветчина"
        label.font = UIFont(name: "Georgia", size: 15)
        return label
    }()
    lazy var ingredienMashroomLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 545, width: 140, height: 100)
        label.text = "Грибы"
        label.font = UIFont(name: "Georgia", size: 15)
        return label
    }()
    lazy var ingredienOlivetsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 605, width: 140, height: 100)
        label.text = "Маслины"
        label.font = UIFont(name: "Georgia", size: 15)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
    }
    private func cofigureUI() {
        view.backgroundColor = .white
        view.addSubview(addPepperoniImageView)
        view.addSubview(addPepperoniLabel)
        view.addSubview(addCheeseSwitch)
        view.addSubview(addHamSwitch)
        view.addSubview(addOliveSwitch)
        view.addSubview(addMashroomsSwitch)
        view.addSubview(addChooeseButton)
        view.addSubview(addBackButton)
        view.addSubview(ingredienСheeseLabel)
        view.addSubview(ingredienHamsLabel)
        view.addSubview(ingredienMashroomLabel)
        view.addSubview(ingredienOlivetsLabel)
    }
    // Возвращает к каталогу пицц по нажатию кнопки
    @objc private func returnToPizzaMenu() {
        dismiss(animated: true, completion: nil)
    }
    // Собирает заказ и переходит в корзину
    @objc private func takeAnOrderAndSendToCart() {
        let ingredientsSwitchesArray = [addCheeseSwitch, addHamSwitch, addMashroomsSwitch, addOliveSwitch]
        let ingredientsArray = [" сыром ", " ветчиной ", " грибами ", " маслинами "]
        for index in 0...3 {
            if ingredientsSwitchesArray[index].isOn {
              pizzaOrder += ingredientsArray[index]
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let cartVC = storyboard.instantiateViewController(withIdentifier: "Cart") as? CartViewController else { return }
        cartVC.myCart = pizzaOrder
        cartVC.modalPresentationStyle = .fullScreen
        show(cartVC, sender: nil)
    }
}
