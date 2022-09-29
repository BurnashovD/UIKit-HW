//
//  MainViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 24.09.2022.
//

import UIKit
// Контроллер со списком дней рождений
class MainViewController: UIViewController {
    // MARK: - Constants for first profile
    lazy var firstProfileNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 110, width: 100, height: 20)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    lazy var firstProfileDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 135, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .gray
        return label
    }()
    lazy var lineUnderFirstProfile: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 170, width: 700, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    // MARK: - Constants for second profile
    lazy var secondProfileNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 190, width: 100, height: 20)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    lazy var secondProfileDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 215, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .gray
        return label
    }()
    lazy var lineUnderSecondProfile: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 250, width: 700, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    // MARK: - Constants for third profile
    lazy var thirdProfileNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 270, width: 100, height: 20)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    lazy var thirdProfileDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 295, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .gray
        return label
    }()
    lazy var lineUnderThirdProfile: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 330, width: 700, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    // MARK: - Constants for four profile
    let fourProfileNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 350, width: 100, height: 20)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    let fourProfileDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 375, width: 300, height: 20)
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .gray
        return label
    }()
    let lineUnderFourProfile: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 410, width: 700, height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    let newProfileVC = NewProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    private func configUI() {
        view.addSubview(firstProfileNameLabel)
        view.addSubview(firstProfileDateLabel)
        view.addSubview(lineUnderFirstProfile)
        view.addSubview(secondProfileNameLabel)
        view.addSubview(secondProfileDateLabel)
        view.addSubview(lineUnderSecondProfile)
        view.addSubview(thirdProfileNameLabel)
        view.addSubview(thirdProfileDateLabel)
        view.addSubview(lineUnderThirdProfile)
        view.addSubview(fourProfileNameLabel)
        view.addSubview(fourProfileDateLabel)
        view.addSubview(lineUnderFourProfile)
    }
}
