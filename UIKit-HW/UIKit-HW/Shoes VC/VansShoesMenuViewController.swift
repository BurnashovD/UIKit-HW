//
//  VansShoesMenuViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 26.09.2022.
//

import UIKit
// Класс отвечает за страницу с вансом
final class VansShoesMenuViewController: UIViewController {
    // MARK: - Visual components
    lazy var vansLogoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vansLogo")
        image.frame = CGRect(x: 160, y: 130, width: 200, height: 130)
        return image
    }()
    lazy var colorsSegmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: differentVansColors)
        segment.frame = CGRect(x: 0, y: 0, width: 380, height: 35)
        segment.center = CGPoint(x: 195, y: 475)
        segment.backgroundColor = .darkGray
        segment.addTarget(self, action: #selector(changeColorOfShoesAction), for: .valueChanged)
        return segment
    }()
    lazy var vansImagesView: UIImageView = {
        let image = UIImageView()
        image.image = vansShoesImages[0]
        image.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        image.center = CGPoint(x: 195, y: 300)
        return image
    }()
    lazy var nameOfShoesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 17, y: 500, width: 150, height: 50)
        label.text = "Vans"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 60)
        label.textColor = .white
        return label
    }()
    lazy var modelOfShoesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 550, width: 180, height: 20)
        label.text = "Old Skool"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textColor = .gray
        return label
    }()
    lazy var aboutVansLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = """
       Vans Old Skool стали настоящим воплощением калифорнийского стиля и любимой обувью скейтбордистов и серферов.

       Кеды, которые станут отличным дополнением каждого гардероба. Данное издание модели изготовлено из прочного текстиля.

       Мысок и пяточная часть выполнены из натуральной замши превосходного качества. Логотип на боковых сторонах выполнен из натуральной кожи.
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
    lazy var spiderManImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "spiderMan")
        image.frame = CGRect(x: 270, y: 20, width: 100, height: 110)
        return image
    }()
    // MARK: - Public propertys
    let differentVansColors = ["Black", "Chess", "Pink"]
    let vansShoesImages = [UIImage(named: "blackVans.jpeg"),
                                UIImage(named: "chessVans.jpeg"),
                                UIImage(named: "pinkVans.jpeg")]
    let sizesArray = Array(38...44)
    let sizesPickerView = UIPickerView()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    // MARK: - Public methods
    func configUI() {
        view.addSubview(vansImagesView)
        view.addSubview(colorsSegmentControl)
        view.addSubview(vansLogoImageView)
        view.addSubview(nameOfShoesLabel)
        view.addSubview(modelOfShoesLabel)
        view.addSubview(aboutVansLabel)
        view.addSubview(shoesSizeTextField)
        view.addSubview(addToCartButton)
        view.addSubview(spiderManImageView)
        shoesSizeTextField.inputView = sizesPickerView
        sizesPickerView.dataSource = self
        sizesPickerView.delegate = self
    }
    // SegmentControl change color of shoes
    @objc private func changeColorOfShoesAction(target: UISegmentedControl) {
        if target == colorsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            vansImagesView.image = vansShoesImages[segmentIndex]
            let whatPersonCheck = target.titleForSegment(at: segmentIndex)
            print(whatPersonCheck ?? "")
        }
    }
    // Alert add to cart or alert choose size
    @objc private func addToCartAlerAction() {
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
