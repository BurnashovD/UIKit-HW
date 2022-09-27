//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit
// Класс отвечающий за главное меню
class MainMenuViewController: UIViewController {
    let profileButton = UIButton()
    let nikeCasualImageView = UIImageView()
    let leftUpperShooeButton = UIButton()
    let rightUpperShooeButton = UIButton()
    let leftDownShooeButton = UIButton()
    let rightDownShooeButton = UIButton()
    let nikeShoesImageView = UIImageView()
    let vansShoesImageView = UIImageView()
    let adidasShoesImageView = UIImageView()
    let secondNikeShoesImageView = UIImageView()
    let spiderManImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Profile button on left side
        profileButton.frame = CGRect(x: 17, y: 45, width: 55, height: 55)
        profileButton.setImage(UIImage(named: "spiderLogo"), for: .normal)
//        profileButton.contentVerticalAlignment = .fill
//        profileButton.contentHorizontalAlignment = .fill
//        profileButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        profileButton.addTarget(self, action: #selector(segueOnProfileVC), for: .touchUpInside)
        view.addSubview(profileButton)
        // MARK: - Large image on menu
        nikeCasualImageView.image = UIImage(named: "nikeCasual")
        nikeCasualImageView.frame = CGRect(x: 0, y: 0, width: 378, height: 300)
        nikeCasualImageView.center = CGPoint(x: 195, y: 260)
        view.addSubview(nikeCasualImageView)
        // MARK: - Button on left upper side with segue target
        leftUpperShooeButton.frame = CGRect(x: 20, y: 430, width: 160, height: 160)
        leftUpperShooeButton.backgroundColor = .secondarySystemFill
        leftUpperShooeButton.layer.cornerRadius = 10
        leftUpperShooeButton.addTarget(self, action: #selector(segueOnNikeVC), for: .touchUpInside)
        view.addSubview(leftUpperShooeButton)
        // MARK: - Button on right upper side with segue target
        rightUpperShooeButton.frame = CGRect(x: 210, y: 430, width: 160, height: 160)
        rightUpperShooeButton.backgroundColor = .secondarySystemFill
        rightUpperShooeButton.layer.cornerRadius = 10
        rightUpperShooeButton.addTarget(self, action: #selector(segueOnVansVC), for: .touchUpInside)
        view.addSubview(rightUpperShooeButton)
        // MARK: - Button on left down side with segue target
        leftDownShooeButton.frame = CGRect(x: 20, y: 620, width: 160, height: 160)
        leftDownShooeButton.backgroundColor = .secondarySystemFill
        leftDownShooeButton.layer.cornerRadius = 10
        leftDownShooeButton.addTarget(self, action: #selector(segueOnAdidasVC), for: .touchUpInside)
        view.addSubview(leftDownShooeButton)
        // MARK: - Button on right down side with segue target
        rightDownShooeButton.frame = CGRect(x: 210, y: 620, width: 160, height: 160)
        rightDownShooeButton.backgroundColor = .secondarySystemFill
        rightDownShooeButton.layer.cornerRadius = 10
        rightDownShooeButton.addTarget(self, action: #selector(segueOnOrangeNikeVC), for: .touchUpInside)
        view.addSubview(rightDownShooeButton)
        // MARK: - Add Nike Shoes Image on left upper button
        nikeShoesImageView.image = UIImage(named: "nikeShoes1")
        nikeShoesImageView.frame = CGRect(x: 47, y: 440, width: 110, height: 105)
        view.addSubview(nikeShoesImageView)
        // MARK: - Add Vans Shoes Image on right upper button
        vansShoesImageView.image = UIImage(named: "vansShoes")
        vansShoesImageView.frame = CGRect(x: 245, y: 435, width: 95, height: 95)
        view.addSubview(vansShoesImageView)
        // MARK: - Add Adidas Shoes Image on left down button
        adidasShoesImageView.image = UIImage(named: "adidasShoes")
        adidasShoesImageView.frame = CGRect(x: 60, y: 630, width: 80, height: 70)
        view.addSubview(adidasShoesImageView)
        // MARK: - Add Orange Nike Shoes on right down button
        secondNikeShoesImageView.image = UIImage(named: "nikeShoes2")
        secondNikeShoesImageView.frame = CGRect(x: 235, y: 620, width: 105, height: 90)
        view.addSubview(secondNikeShoesImageView)
        //MARK: - SpiderMan image
        spiderManImageView.image = UIImage(named: "spiderMan")
        spiderManImageView.frame = CGRect(x: 270, y: 10, width: 100, height: 100)
        view.addSubview(spiderManImageView)
    }
    // MARK: - Method to segue on Nike VeiwController
    @objc func segueOnNikeVC() {
        performSegue(withIdentifier: "nikeSegue", sender: self)
    }
    // MARK: - Method to segue on Vans VeiwController
    @objc func segueOnVansVC() {
        performSegue(withIdentifier: "vansSegue", sender: self)
    }
    // MARK: - Method to segue on Adidas ViewController
    @objc func segueOnAdidasVC() {
        performSegue(withIdentifier: "adidasSegue", sender: self)
    }
    // MARK: - Method to segue on Orange Nike VeiwController
    @objc func segueOnOrangeNikeVC() {
        performSegue(withIdentifier: "orangeNikeSegue", sender: self)
    }
    //MARK: - Method to segue on Profile VeiwController
    @objc func segueOnProfileVC() {
        performSegue(withIdentifier: "profile", sender: self)
    }
}
