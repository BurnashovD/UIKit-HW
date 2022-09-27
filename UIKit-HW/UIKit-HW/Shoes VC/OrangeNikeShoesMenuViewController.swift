//
//  OrangeNikeShoesMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
// Класс отвечает за страницу с кросовками найк
class OrangeNikeShoesMenuViewController: UIViewController {
    let nikeLogoImageView = UIImageView()
    let differentNikeColors = ["Blue", "Orange", "White"]
    var colorsSegmentControl = UISegmentedControl()
    let nikeImagesView = UIImageView()
    let nikeShoesImagesArray = [UIImage(named: "blueJordan.jpeg"),
                                UIImage(named: "orangeJordan.jpeg"),
                                UIImage(named: "whiteJordan.jpeg")]
    let nameOfShoesLabel = UILabel()
    let modelOfShoesLabel = UILabel()
    let aboutNikeLabel = UILabel()
    let shoesSizeTextField = UITextField()
    let sizesArray = Array(38...44)
    let sizesPickerView = UIPickerView()
    let addToCartButton = UIButton()
    let spiderManImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Label with brand name
        nameOfShoesLabel.frame = CGRect(x: 17, y: 500, width: 150, height: 50)
        nameOfShoesLabel.text = "Nike"
        nameOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        nameOfShoesLabel.textColor = .white
        // MARK: - Label with model
        modelOfShoesLabel.frame = CGRect(x: 20, y: 550, width: 180, height: 20)
        modelOfShoesLabel.text = "Air Jordan 1 Mid"
        modelOfShoesLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        modelOfShoesLabel.textColor = .gray
        // MARK: - Description about shoes TextField
        aboutNikeLabel.lineBreakMode = .byWordWrapping
        aboutNikeLabel.numberOfLines = 0
        aboutNikeLabel.text = """
Особенности:

   Вставка Air-Sole обеспечивает легкость и амортизацию.

   Верх из кожи и синтетической ткани для прочности и
   превосходного внешнего вида.

   Подметка из твердой резины обеспечивает усиленное
   сцепление с различными поверхностями.
"""
        aboutNikeLabel.frame = CGRect(x: 18, y: 465, width: 370, height: 400)
        aboutNikeLabel.font = UIFont(name: "Arial", size: 13)
        aboutNikeLabel.textColor = .lightGray
        // MARK: - Default Black Nike image
        nikeImagesView.image = nikeShoesImagesArray[0]
        nikeImagesView.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        nikeImagesView.center = CGPoint(x: 195, y: 300)
        view.addSubview(nikeImagesView)
        // MARK: - Colors of shoes SegmentControl
        colorsSegmentControl = UISegmentedControl(items: differentNikeColors)
        colorsSegmentControl.frame = CGRect(x: 0, y: 0, width: 380, height: 35)
        colorsSegmentControl.center = CGPoint(x: 195, y: 475)
        colorsSegmentControl.backgroundColor = .darkGray
        colorsSegmentControl.addTarget(self, action: #selector(changeColorOfShoes), for: .valueChanged)
        view.addSubview(colorsSegmentControl)
        // MARK: - Nike Logo
        nikeLogoImageView.image = UIImage(named: "nikeLogo")
        nikeLogoImageView.frame = CGRect(x: 300, y: 160, width: 80, height: 50)
        view.addSubview(nikeLogoImageView)
        view.addSubview(nameOfShoesLabel)
        view.addSubview(modelOfShoesLabel)
        view.addSubview(aboutNikeLabel)
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
            nikeImagesView.image = nikeShoesImagesArray[segmentIndex]
            let whatPersonCheck = target.titleForSegment(at: segmentIndex)
            print(whatPersonCheck ?? "")
        }
    }
    // MARK: - Alert add to cart or alert choose size
    @objc func addToCartAler() {
        if shoesSizeTextField.text != "" {
        let alertController = UIAlertController(title: "Добавить в корзину?", message: nil, preferredStyle: .alert)
        let yesAlertAction = UIAlertAction(title: "Да", style: .default)
        let cancelAlertAction = UIAlertAction(title: "Отменить", style: .cancel)
        alertController.addAction(yesAlertAction)
        alertController.addAction(cancelAlertAction)
        present(alertController, animated: true, completion: nil)
    } else if shoesSizeTextField.text == "" {
        let emptyFieldAlertController = UIAlertController(title: "Сначала выберите размер", message: nil, preferredStyle: .alert)
        let emptyFieldAlertAction = UIAlertAction(title: "Ok", style: .cancel)
        emptyFieldAlertController.addAction(emptyFieldAlertAction)
        present(emptyFieldAlertController, animated: true, completion: nil)
        }
    }
}
// MARK: - Extension for Delegate and DataSource
extension OrangeNikeShoesMenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
      
