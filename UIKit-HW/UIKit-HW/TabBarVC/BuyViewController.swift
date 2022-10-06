//
//  BuyViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 06.10.2022.
//

import UIKit

final class BuyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       configUI()
    }
    
    private func configUI() {
       configTabBar()
        view.backgroundColor = .black
    }
    
    private func configTabBar() {
        tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 2)
    }
}
