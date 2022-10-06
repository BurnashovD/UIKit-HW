//
//  ForMeViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 06.10.2022.
//

import UIKit

final class ForMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        congigUI()
    }
    
    private func congigUI() {
        configTabBar()
        view.backgroundColor = .black
    }
    
    private func configTabBar() {
        tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "person.circle"), tag: 1)
        tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        
    }
}
