//
//  VansShoesMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
// Класс отвечает за страницу с вансом
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
    let sizesArray = Array(38...44)
    let sizesPickerView = UIPickerView()
    let addToCartButton = UIButton()
    let spiderManImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Label with brand name
        nameOfShoesLabel.frame = CGRect(x: 17, y: 500, width: 150, height: 50)
        nameOfShoesLabel.text = "Vans"
        nameOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        nameOfShoesLabel.textColor = .white
        // MARK: - Label with model
        modelOfShoesLabel.frame = CGRect(x: 66, y: 550, width: 150, height: 20)
        modelOfShoesLabel.text = "Old Skool"
        modelOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        modelOfShoesLabel.textColor = .gray
        // MARK: - Description about shoes TextField
        aboutVansLabel.lineBreakMode = .byWordWrapping
        aboutVansLabel.numberOfLines = 0
        aboutVansLabel.text = """
       Vans Old Skool стали настоящим воплощением калифорнийского стиля и любимой обувью скейтбордистов и серферов.

       Кеды, которые станут отличным дополнением каждого гардероба. Данное издание модели изготовлено из прочного текстиля.

       Мысок и пяточная часть выполнены из натуральной замши превосходного качества. Логотип на боковых сторонах выполнен из натуральной кожи.
"""
        aboutVansLabel.frame = CGRect(x: 18, y: 465, width: 370, height: 400)
        aboutVansLabel.font = UIFont(name: "Arial", size: 13)
        aboutVansLabel.textColor = .lightGray
        // MARK: - Default Black Vans image
        vansImagesView.image = vansShoesImagesArray[0]
        vansImagesView.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        vansImagesView.center = CGPoint(x: 195, y: 300)
        view.addSubview(vansImagesView)
        // MARK: - Colors of shoes SegmentControl
        colorsSegmentControl = UISegmentedControl(items: differentVansColors)
        colorsSegmentControl.frame = CGRect(x: 0, y: 0, width: 380, height: 35)
        colorsSegmentControl.center = CGPoint(x: 195, y: 475)
        colorsSegmentControl.backgroundColor = .darkGray
        colorsSegmentControl.addTarget(self, action: #selector(changeColorOfShoes), for: .valueChanged)
        view.addSubview(colorsSegmentControl)
        // MARK: - Vans Logo
        vansLogoImageView.image = UIImage(named: "vansLogo")
        vansLogoImageView.frame = CGRect(x: 160, y: 130, width: 200, height: 130)
        view.addSubview(vansLogoImageView)
        view.addSubview(nameOfShoesLabel)
        view.addSubview(modelOfShoesLabel)
        view.addSubview(aboutVansLabel)
        // MARK: - TextField and PickerView with shoes sizes
        shoesSizeTextField.frame = CGRect(x: 25, y: 770, width: 250, height: 50)
        shoesSizeTextField.backgroundColor = .black
        shoesSizeTextField.textColor = .white
        shoesSizeTextField.autocorrectionType = .no
        shoesSizeTextField.layer.cornerRadius = 8
        shoesSizeTextField.textAlignment = .center
        shoesSizeTextField.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        shoesSizeTextField.placeholder = "Выберите размер"
        view.addSubview(shoesSizeTextField)
        // MARK: - Input Picker in TextField and sub on protocols
        shoesSizeTextField.inputView = sizesPickerView
        sizesPickerView.dataSource = self
        sizesPickerView.delegate = self
        // MARK: - Add to cart button
        addToCartButton.frame = CGRect(x: 290, y: 770, width: 80, height: 50)
        addToCartButton.backgroundColor = .black
        addToCartButton.layer.cornerRadius = 8
        addToCartButton.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        addToCartButton.addTarget(self, action: #selector(addToCartAler), for: .touchUpInside)
        view.addSubview(addToCartButton)
        // MARK: - SpiderMan image
        spiderManImageView.image = UIImage(named: "spiderMan")
        spiderManImageView.frame = CGRect(x: 270, y: 20, width: 100, height: 110)
        view.addSubview(spiderManImageView)
    }
    // MARK: - SegmentControl change color of shoes
    @objc func changeColorOfShoes(target: UISegmentedControl) {
        if target == colorsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            vansImagesView.image = vansShoesImagesArray[segmentIndex]
            let whatPersonCheck = target.titleForSegment(at: segmentIndex)
            print(whatPersonCheck ?? "")
        }
    }
    // MARK: - Alert add to cart
    @objc func addToCartAler() {
        let alertController = UIAlertController(title: "Добавить в корзину?", message: nil, preferredStyle: .alert)
        let yesAlertAction = UIAlertAction(title: "Да", style: .default)
        let cancelAlertAction = UIAlertAction(title: "Отменить", style: .cancel)
        alertController.addAction(yesAlertAction)
        alertController.addAction(cancelAlertAction)
        present(alertController, animated: true, completion: nil)
    }
}
// MARK: - Extension for Delegate and DataSource
extension VansShoesMenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return sizesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        shoesSizeTextField.text = "\(sizesArray[row]) EU"
        shoesSizeTextField.resignFirstResponder()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(sizesArray[row])
    }
}
