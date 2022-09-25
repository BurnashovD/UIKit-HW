//
//  MainViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 24.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    // constants for first profile
    var firstProfileNameLabel = UILabel()
    let firstProfileDateLabel = UILabel()
    let lineUnderFirstProfile = UIView()
    // constants for second profile
    let secondProfileNameLabel = UILabel()
    let secondProfileDateLabel = UILabel()
    let lineUnderSecondProfile = UIView()
    //constants for third profile
    let thirdProfileNameLabel = UILabel()
    let thirdProfileDateLabel = UILabel()
    let lineUnderThirdProfile = UIView()
    //constants for four profile
    let fourProfileNameLabel = UILabel()
    let fourProfileDateLabel = UILabel()
    let lineUnderFourProfile = UIView()
    let newProfileVC = NewProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - First Profile
        firstProfileNameLabel.frame = CGRect(x: 30, y: 110, width: 100, height: 20)
        firstProfileNameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        
        firstProfileDateLabel.frame = CGRect(x: 30, y: 135, width: 300, height: 20)
        firstProfileDateLabel.font = UIFont(name: "Arial", size: 15)
        firstProfileDateLabel.textColor = .gray
        lineUnderFirstProfile.frame = CGRect(x: 0, y: 170, width: 700, height: 1)
        lineUnderFirstProfile.backgroundColor = .lightGray
        
        view.addSubview(firstProfileNameLabel)
        view.addSubview(firstProfileDateLabel)
        view.addSubview(lineUnderFirstProfile)
        
        //MARK: - Second Profile
        secondProfileNameLabel.frame = CGRect(x: 30, y: 190, width: 100, height: 20)
        secondProfileNameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
       
        secondProfileDateLabel.frame = CGRect(x: 30, y: 215, width: 300, height: 20)
        secondProfileDateLabel.font = UIFont(name: "Arial", size: 15)
        secondProfileDateLabel.textColor = .gray
        lineUnderSecondProfile.frame = CGRect(x: 0, y: 250, width: 700, height: 1)
        lineUnderSecondProfile.backgroundColor = .lightGray
        
        view.addSubview(secondProfileNameLabel)
        view.addSubview(secondProfileDateLabel)
        view.addSubview(lineUnderSecondProfile)
        
        //MARK: - Third Profile
        thirdProfileNameLabel.frame = CGRect(x: 30, y: 270, width: 100, height: 20)
        thirdProfileNameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        
        thirdProfileDateLabel.frame = CGRect(x: 30, y: 295, width: 300, height: 20)
        thirdProfileDateLabel.font = UIFont(name: "Arial", size: 15)
        thirdProfileDateLabel.textColor = .gray
        lineUnderThirdProfile.frame = CGRect(x: 0, y: 330, width: 700, height: 1)
        lineUnderThirdProfile.backgroundColor = .lightGray
        
        view.addSubview(thirdProfileNameLabel)
        view.addSubview(thirdProfileDateLabel)
        view.addSubview(lineUnderThirdProfile)
        
        //MARK: - Four Profile
        fourProfileNameLabel.frame = CGRect(x: 30, y: 350, width: 100, height: 20)
        fourProfileNameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        
        fourProfileDateLabel.frame = CGRect(x: 30, y: 375, width: 300, height: 20)
        fourProfileDateLabel.font = UIFont(name: "Arial", size: 15)
        fourProfileDateLabel.textColor = .gray
        lineUnderFourProfile.frame = CGRect(x: 0, y: 410, width: 700, height: 1)
        lineUnderFourProfile.backgroundColor = .lightGray
        
        view.addSubview(fourProfileNameLabel)
        view.addSubview(fourProfileDateLabel)
        view.addSubview(lineUnderFourProfile)
        
    }
    

}
