//
//  CartViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Корзина
class CartViewController: UIViewController {
    @IBOutlet weak var promocodeCheckLabel: UILabel!
    var myCart = ""
    lazy var addYourOrderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 150, width: 200, height: 40)
        label.text = "Ваш заказ:"
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 40)
        return label
    }()
    lazy var myOrder: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 250, width: 300, height: 100)
        label.font = UIFont(name: "Marker Felt Thin", size: 25)
        label.textColor = .orange
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = myCart
        return label
    }()
    lazy var createNavigationBar: UINavigationBar = {
        let bar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 44))
        let navTitle = UINavigationItem(title: "Оплата")
        bar.setItems([navTitle], animated: true)
        return bar
    }()
    lazy var createCardPaySwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 600, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(cardOrCashPay), for: .touchUpInside)
        return switcher
    }()
    lazy var createCashPaySwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 300, y: 650, width: 50, height: 50)
        switcher.setOn(true, animated: true)
        switcher.addTarget(self, action: #selector(cashOrCardPay), for: .touchUpInside)
        return switcher
    }()
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        button.center = CGPoint(x: 200, y: 780)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.setTitle("Оплатить наличными", for: .normal)
        button.addTarget(self, action: #selector(finishAlert), for: .touchUpInside)
        return button
    }()
    lazy var promocodeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        label.center = CGPoint(x: 200, y: 500)
        label.text = "Промокод"
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 20)
        return label
    }()
    lazy var promocodeTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        field.center = CGPoint(x: 195, y: 530)
        field.textAlignment = .center
        field.placeholder = "Введите промокод"
        field.font = UIFont(name: "Marker Felt Thin", size: 15)
        field.textColor = .orange
        field.addTarget(self, action: #selector(checkPromocode), for: .editingDidEnd)
        return field
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
        hideKeyboardWhenTappedAround()
    }
    private func cofigureUI() {
        title = "Оплата"
        view.addSubview(createNavigationBar)
        view.addSubview(addYourOrderLabel)
        view.addSubview(myOrder)
        view.addSubview(createCardPaySwitch)
        view.addSubview(createCashPaySwitch)
        view.addSubview(payButton)
        view.addSubview(promocodeLabel)
        view.addSubview(promocodeTextField)
        promocodeLabel.textColor = .orange
    }
    // Два метода для свитчей
    @objc private func cashOrCardPay() {
        if createCashPaySwitch.isOn {
            createCardPaySwitch.setOn(false, animated: true)
            payButton.setTitle("Оплатить наличными", for: .normal)
        }
    }
    @objc private func cardOrCashPay() {
        if createCardPaySwitch.isOn {
            createCashPaySwitch.setOn(false, animated: true)
            payButton.setTitle("Оплатить картой", for: .normal)
        }
    }
    // Вызывает алерт при оформлении
    @objc func finishAlert() {
        let paymentAlertController = UIAlertController(title: "Cпасибо за заказ!",
                                                       message: "Курьер приедет в течении часа", preferredStyle: .alert)
        let paymentAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let menuVC = storyboard.instantiateViewController(withIdentifier: "Menu") as? MenuViewController else { return }
            menuVC.modalPresentationStyle = .fullScreen
            self.show(menuVC, sender: nil)
        }
        let orderReportAction = UIAlertAction(title: "Оставить отзыв", style: .cancel) { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let reportVC = storyboard.instantiateViewController(withIdentifier: "Report") as? ReportViewController else { return }
            reportVC.modalPresentationStyle = .fullScreen
            self.show(reportVC, sender: nil)
        }
        paymentAlertController.addAction(paymentAlertAction)
        paymentAlertController.addAction(orderReportAction)
        present(paymentAlertController, animated: true, completion: nil)
    }
    // Проверяет промокод
    @objc func checkPromocode() {
        if promocodeTextField.text == "ROADMAP" {
            promocodeCheckLabel.text = "Cкидка 10%"
        } else {
            promocodeCheckLabel.text = "Недействительный промокод"
        }
    }
}
// Расширение чтоб убирать клавиатуру по нажитию на экран
extension CartViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
