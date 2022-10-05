//
//  LastViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 05.10.2022.
//

import UIKit

final class LastViewController: UIViewController {
    
    private lazy var goToStartVCButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        button.center = CGPoint(x: 200, y: 400)
        button.setTitle("Start VC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = "Last VC"
        view.addSubview(goToStartVCButton)
    }
    
    
}


