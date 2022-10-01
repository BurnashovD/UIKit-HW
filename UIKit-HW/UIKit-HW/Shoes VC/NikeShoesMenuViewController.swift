//
//  NikeShoesMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
// Класс отвечает за страницу с кросовками найк
final class NikeShoesMenuViewController: UIViewController {
    // MARK: - Visual components
    lazy var nikeLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "nikeLogo")
        image.frame = CGRect(x: 300, y: 160, width: 80, height: 50)
        return image
    }()
    lazy var colorsSegmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: differentNikeColors)
        segment.frame = CGRect(x: 0, y: 0, width: 380, height: 35)
        segment.center = CGPoint(x: 195, y: 475)
        segment.backgroundColor = .darkGray
        segment.addTarget(self, action: #selector(changeColorOfShoesAction), for: .valueChanged)
        return segment
    }()
    lazy var nikeImagesView: UIImageView = {
        let image = UIImageView()
        image.image = nikeShoesImagesArray[0]
        image.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        image.center = CGPoint(x: 195, y: 300)
        return image
    }()
    lazy var nameOfShoesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 17, y: 500, width: 150, height: 50)
        label.text = "Nike"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        label.textColor = .white
        return label
    }()
    lazy var modelOfShoesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 550, width: 180, height: 20)
        label.text = "Air Zoom"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textColor = .gray
        return label
    }()
    lazy var aboutNikeLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = """
Кроссовки Nike Air Zoom SuperRep разработаны для поддержки и амортизации во время интервальных тренировок высокой интенсивности.

       Конструкция верха поддерживает стопу во время
       тренировки.
    
       Пеноматериал Cushlon и 2 вставки Zoom Air
       обеспечивают эффективную амортизацию
       ударных нагрузок.
       
       Материал верха хорошо пропускает воздух.
"""
        label.frame = CGRect(x: 18, y: 465, width: 370, height: 400)
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .lightGray
        return label
    }()
    lazy var shoesSizeTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 25, y: 770, width: 250, height: 50)
        field.backgroundColor = .black
        field.textColor = .white
        field.autocorrectionType = .no
        field.layer.cornerRadius = 8
        field.textAlignment = .center
        field.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        field.placeholder = "Выберите размер"
        return field
    }()
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 290, y: 770, width: 80, height: 50)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        button.addTarget(self, action: #selector(addToCartAlerAction), for: .touchUpInside)
        return button
    }()
    lazy var spiderManButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "spiderMan"), for: .normal)
        button.frame = CGRect(x: 270, y: 10, width: 100, height: 100)
        button.addTarget(self, action: #selector(callActivityView), for: .touchUpInside)
        return button
    }()
    // MARK: - Public propertys
    let differentNikeColors = ["Black", "White", "Green"]
    let nikeShoesImagesArray = [UIImage(named: "blackNikeee.png"),
                                UIImage(named: "whiteNikeShoes.jpeg"),
                                UIImage(named: "greenNike.jpeg")]
    let sizesArray = Array(38...44)
    let sizesPickerView = UIPickerView()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    // MARK: - Public methods
    func configUI() {
        view.addSubview(nikeImagesView)
        view.addSubview(colorsSegmentControl)
        view.addSubview(nikeLogoImageView)
        view.addSubview(nameOfShoesLabel)
        view.addSubview(modelOfShoesLabel)
        view.addSubview(aboutNikeLabel)
        view.addSubview(shoesSizeTextField)
        view.addSubview(addToCartButton)
        view.addSubview(spiderManButton)
        shoesSizeTextField.inputView = sizesPickerView
        sizesPickerView.dataSource = self
        sizesPickerView.delegate = self
    }
    // SegmentControl change color of shoes
    @objc func changeColorOfShoesAction(target: UISegmentedControl) {
        if target == colorsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            nikeImagesView.image = nikeShoesImagesArray[segmentIndex]
            let whatPersonCheck = target.titleForSegment(at: segmentIndex)
            print(whatPersonCheck ?? "")
        }
    }
    // Alert add to cart or alert choose size
    @objc func addToCartAlerAction() {
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
    // Call activity view when touch spider
    @objc func callActivityView() {
        let facebookURL = NSURL(string: "https://ru-ru.facebook.com/")
        let activityViewController = UIActivityViewController(activityItems: ["\(nameOfShoesLabel.text ?? "nil") \(modelOfShoesLabel.text ?? "nil") - Spider Shoes", facebookURL ?? "nil"], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}
// MARK: - Extension for Delegate and DataSource
extension NikeShoesMenuViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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


