//
//  MainMuneViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 03.10.2022.
//

import UIKit
// Класс основного меню копилки
final class MainMenuViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var addMoneyButton: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var moneySymbolLabel: UILabel!
    @IBOutlet weak var rubleSwitch: UISwitch!
    @IBOutlet weak var euroSwitch: UISwitch!
    
    // MARK: - Private propeties
    private var total = ""
    private var totalValue = 0
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        addMoneyButton.addTarget(self, action: #selector(addMoneyAlertAction), for: .touchUpInside)
        rubleSwitch.addTarget(self, action: #selector(rubleOrEuro), for: .allEvents)
        euroSwitch.addTarget(self, action: #selector(euroOrRuble), for: .allEvents)
        shareButton.addTarget(self, action: #selector(shareToFriendsAction), for: .touchUpInside)
        rubleSwitch.setOn(true, animated: true)
        euroSwitch.setOn(false, animated: true)
    }
   
    // MARK: - Private methods
    @objc private func addMoneyAlertAction() {
        let moneyAlertController = UIAlertController(title: "Введите сумму",
                                                     message: nil, preferredStyle: .alert)
        let moneyAlertAction = UIAlertAction(title: "Готово", style: .cancel) { _ in
            self.total = moneyAlertController.textFields?.first?.text ?? ""
            self.totalValue += Int(self.total) ?? 0
            self.moneyLabel.text = String(self.totalValue)
        }
        moneyAlertController.addAction(moneyAlertAction)
        moneyAlertController.addTextField(configurationHandler: nil)
        present(moneyAlertController, animated: true, completion: nil)
    }
    
    @objc private func rubleOrEuro() {
        if rubleSwitch.isOn {
            euroSwitch.setOn(false, animated: true)
            moneyLabel.text = String(totalValue)
            moneySymbolLabel.text = "₽"
        }
    }
    
    @objc private func euroOrRuble() {
        if euroSwitch.isOn {
            rubleSwitch.setOn(false, animated: true)
            moneySymbolLabel.text = "€"
            moneyLabel.text = String(format: "%.2f", (Float(totalValue) / 58.6))
        }
    }
    
    @objc private func shareToFriendsAction() {
        let activityVC = UIActivityViewController(activityItems: ["В моей копилке: \(totalValue) шекелей",
                                                                  UIImage(named: "richLife") ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
