//
//  VansShoesMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit

class VansShoesMenuViewController: UIViewController {
    let vansLogoImageView = UIImageView()
    let differentVansColors = ["Black", "Chess", "Pink"]
    var colorsSegmentControl = UISegmentedControl()
    let vansImagesView = UIImageView()
    let vansShoesImagesArray = [UIImage(named: "blackVans.jpeg"),
                                UIImage(named: "chessVans.jpeg"),
                                UIImage(named: "pinkVans.jpeg")]
    let nameOfShoesLabel = UILabel()
    let modelOfShoesLabel = UILabel()
    let aboutVansLabel = UILabel()
    let shoesSizeTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOfShoesLabel.frame = CGRect(x: 17, y: 500, width: 150, height: 50)
        nameOfShoesLabel.text = "Vans"
        nameOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        nameOfShoesLabel.textColor = .white
        
        modelOfShoesLabel.frame = CGRect(x: 66, y: 550, width: 150, height: 20)
        modelOfShoesLabel.text = "Old Skool"
        modelOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        modelOfShoesLabel.textColor = .gray
        
        aboutVansLabel.lineBreakMode = .byWordWrapping
        aboutVansLabel.numberOfLines = 0
        aboutVansLabel.text = """
       Vans Old Skool стали настоящим воплощением калифорнийского стиля и любимой обувью скейтбордистов и серферов.

       Кеды, которые станут отличным дополнением каждого гардероба. Данное издание модели изготовлено из прочного текстиля.

       Мысок и пяточная часть выполнены из натуральной замши превосходного качества. Логотип на боковых сторонах выполнен из натуральной кожи.
"""
        aboutVansLabel.frame = CGRect(x: 18, y: 460, width: 370, height: 400)
        aboutVansLabel.font = UIFont(name: "Arial", size: 13)
        aboutVansLabel.textColor = .lightGray
        

        vansImagesView.image = vansShoesImagesArray[0]
        vansImagesView.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        vansImagesView.center = CGPoint(x: 195, y: 300)
        view.addSubview(vansImagesView)
        
        colorsSegmentControl = UISegmentedControl(items: differentVansColors)
        colorsSegmentControl.frame = CGRect(x: 0, y: 0, width: 380, height: 35)
        colorsSegmentControl.center = CGPoint(x: 195, y: 475)
        colorsSegmentControl.backgroundColor = .darkGray
        colorsSegmentControl.addTarget(self, action: #selector(changeColorOfShoes), for: .valueChanged)
        view.addSubview(colorsSegmentControl)
        
        vansLogoImageView.image = UIImage(named: "vansLogo")
        vansLogoImageView.frame = CGRect(x: 15, y: 50, width: 200, height: 130)
        view.addSubview(vansLogoImageView)
        view.addSubview(nameOfShoesLabel)
        view.addSubview(modelOfShoesLabel)
        view.addSubview(aboutVansLabel)
        
        // Доделать Пикер с Размерами
        shoesSizeTextField.frame = CGRect(x: 15, y: 780, width: 250, height: 30)
        shoesSizeTextField.backgroundColor = .lightGray
        shoesSizeTextField.autocorrectionType = .no
        view.addSubview(shoesSizeTextField)
        
    }
    @objc func changeColorOfShoes(target: UISegmentedControl) {
        if target == colorsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            vansImagesView.image = vansShoesImagesArray[segmentIndex]
            let whatPersonCheck = target.titleForSegment(at: segmentIndex)
            print(whatPersonCheck ?? "")
        }
    }


}
