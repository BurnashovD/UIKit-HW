//
//  ViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 21.09.2022.
//

import UIKit
// Класс отвечающий за главное меню
final class MainMenuViewController: UIViewController {
    // MARK: - Visual components
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 17, y: 45, width: 55, height: 55)
        button.setImage(UIImage(named: "spiderLogo"), for: .normal)
        button.addTarget(self, action: #selector(segueOnProfileVCAction), for: .touchUpInside)
        return button
    }()
    lazy var nikeCasualImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nikeCasual")
        imageView.frame = CGRect(x: 0, y: 0, width: 378, height: 300)
        imageView.center = CGPoint(x: 195, y: 260)
        return imageView
    }()
    lazy var leftUpperShooeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 430, width: 160, height: 160)
        button.backgroundColor = .secondarySystemFill
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(segueOnNikeVCAction), for: .touchUpInside)
        return button
    }()
    lazy var rightUpperShooeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 210, y: 430, width: 160, height: 160)
        button.backgroundColor = .secondarySystemFill
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(segueOnVansVCAction), for: .touchUpInside)
        return button
    }()
    lazy var leftDownShooeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 620, width: 160, height: 160)
        button.backgroundColor = .secondarySystemFill
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(segueOnAdidasVCAction), for: .touchUpInside)
        return button
    }()
    lazy var rightDownShooeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 210, y: 620, width: 160, height: 160)
        button.backgroundColor = .secondarySystemFill
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(segueOnOrangeNikeVCAction), for: .touchUpInside)
        return button
    }()
    lazy var nikeShoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nikeShoes1")
        imageView.frame = CGRect(x: 47, y: 440, width: 110, height: 105)
        return imageView
    }()
    lazy var vansShoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vansShoes")
        imageView.frame = CGRect(x: 245, y: 435, width: 95, height: 95)
        return imageView
    }()
    lazy var adidasShoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "adidasShoes")
        imageView.frame = CGRect(x: 60, y: 630, width: 80, height: 70)
        return imageView
    }()
    lazy var secondNikeShoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nikeShoes2")
        imageView.frame = CGRect(x: 235, y: 620, width: 105, height: 90)
        return imageView
    }()
    lazy var spiderManImageView: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "spiderMan"), for: .normal)
        button.frame = CGRect(x: 270, y: 10, width: 100, height: 100)
        button.addTarget(self, action: #selector(callActivityviewAction), for: .touchUpInside)
        return button
    }()
    // MARK: - Public propertys
    var activityViewController: UIActivityViewController? = nil
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        view.addSubview(profileButton)
        view.addSubview(nikeCasualImageView)
        view.addSubview(leftUpperShooeButton)
        view.addSubview(rightUpperShooeButton)
        view.addSubview(leftDownShooeButton)
        view.addSubview(rightDownShooeButton)
        view.addSubview(nikeShoesImageView)
        view.addSubview(vansShoesImageView)
        view.addSubview(adidasShoesImageView)
        view.addSubview(secondNikeShoesImageView)
        view.addSubview(spiderManImageView)
    }
    
    @objc func segueOnNikeVCAction() {
        performSegue(withIdentifier: "nikeSegue", sender: self)
    }
  
    @objc func segueOnVansVCAction() {
        performSegue(withIdentifier: "vansSegue", sender: self)
    }

    @objc func segueOnAdidasVCAction() {
        performSegue(withIdentifier: "adidasSegue", sender: self)
    }
   
    @objc func segueOnOrangeNikeVCAction() {
        performSegue(withIdentifier: "orangeNikeSegue", sender: self)
    }
  
    @objc func segueOnProfileVCAction() {
        performSegue(withIdentifier: "profile", sender: self)
    }
  
    @objc func callActivityviewAction() {
        activityViewController = UIActivityViewController(activityItems: ["Spider Man!!!"], applicationActivities: nil)
        if activityViewController != nil {
        present(activityViewController!, animated: true, completion: nil)
        } else {
            print("nothing in there")
        }
    }
}
